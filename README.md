# volume-nfs

Alpine NFSv4 server
defaults to exporting `/srv`

## quick start

````
$> docker run \
-ti \
-p 2049:2049 \
--cap-add SYS_ADMIN \
--rm \
shokohsc/volume-nfs
````

## export another path

````
$> docker run \
-d \
-p 2049:2049 \
--cap-add SYS_ADMIN \
--name nfs \
shokohsc/volume-nfs \
/path/to/export
````

or

````
$> docker run \
-d \
-p 2049:2049 \
--cap-add SYS_ADMIN \
--name nfs \
-v $(pwd):/path/to/export \
shokohsc/volume-nfs \
/path/to/export
````
