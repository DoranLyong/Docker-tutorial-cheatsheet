XAUTH=/tmp/.docker.xauth

mkdir $XAUTH

if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    sudo chmod a+r $XAUTH
fi


sudo docker run -t -d \
    --name pt1.13-cu11.8 \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --runtime=nvidia \
    --cpuset-cpus=0-29 \
    --gpus=all \
    --net=host \
    --ipc=host \
    -v /dev/shm:/dev/shm \
    -v $HOME/Workspace:/workspace \
    -v $HOME/linearRAID/datasets:/datasets \
    nvcr.io/nvidia/pytorch:22.11-py3 \
    bash
