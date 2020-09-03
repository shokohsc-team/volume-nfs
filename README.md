# volume-nfs

Alpine NFSv4 server
defaults to exporting `/srv`

## quick start

````
$> docker run \
--rm \
-ti \
-p 2049:2049 \
--privileged \
shokohsc/volume-nfs
````

## export another path

````
$> docker run \
-d \
-p 2049:2049 \
--privileged \
--name nfs \
shokohsc/volume-nfs \
/path/to/export
````

or

````
$> docker run \
-d \
-p 2049:2049 \
--privileged \
--name nfs \
-v $(pwd):/path/to/export \
shokohsc/volume-nfs \
/path/to/export
````
