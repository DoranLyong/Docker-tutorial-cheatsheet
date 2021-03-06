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


docker run -it \
    --name pytorch1.9.0-cuda10.2 \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --gpus all \
    -v $HOME:/workspace \
    doranlyong/pytorch:1.9.0-cuda10.2 \
    bash
