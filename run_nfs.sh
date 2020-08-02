#!/bin/sh

function start()
{
    echo "$@    *(fsid=0,rw,sync,nohide,no_root_squash,no_subtree_check,insecure)" > /etc/exports
    cat /etc/exports
    ls -lah $@

    /usr/sbin/exportfs -rv
    /usr/sbin/exportfs -s
    /usr/sbin/exportfs

    /usr/sbin/rpc.nfsd --debug --port 2049 --no-nfs-version 2 --no-nfs-version 3 --no-udp
    cat /proc/fs/nfsd/versions

    /usr/sbin/rpc.mountd --debug all --no-nfs-version 2 --no-nfs-version 3 --no-udp
}

function stop()
{
    echo "Stopping NFS"

    /usr/sbin/rpc.nfsd 0
    /usr/sbin/exportfs -auv
    /usr/sbin/exportfs -f

    kill $( pidof rpc.mountd )
    umount /proc/fs/nfsd
    echo > /etc/exports
    exit 0
}


trap stop TERM

start "$@"

# Ugly hack to do nothing and wait for SIGTERM
while true; do
    sleep 5
done
