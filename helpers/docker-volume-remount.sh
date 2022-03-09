OLD_VOLUME=""
NEW_VOLUME=""

docker volume create --name $NEW_VOLUME
docker run --rm -it -v $OLD_VOLUME:/from -v $NEW_VOLUME:/to alpine ash -c "cd /from ; cp -av . /to"
#docker volume rm $OLD_VOLUME