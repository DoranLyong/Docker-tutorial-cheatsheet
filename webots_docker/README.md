# Webots Docker 실행하기 



#### 1. Docker Hub에서 webots 풀(pull)
* [여기 링크](https://hub.docker.com/r/cyberbotics/webots/tags?page=1&ordering=last_updated)로 가서 원하는 버전 다운 

<br/> 


#### 2.Webots Docker 실행 
* [여기 링크](https://cyberbotics.com/doc/guide/installation-procedure#installing-the-docker-image)를 참고해서 ```With GPU Acceleration``` 모드로 실행 
```bash
~$ xhost +  

~$ docker run 
--name <컨테이너 이름> \ 
--gpus=all \ 
--net=host \    # 로컬  PC의 IP와 동일하게 
--ipc=host \    # 컨테이너간 소켓통신
-v /tmp/.X11-unix:/tmp/.X11-unix:rw  \    # Host의 X-window 컨테이너의 X-window 연결 (volume mount)
--device=/dev/video0:/dev/video0 \     # Host의 카메라 장비를 컨테이너에 전달  
-e DISPLAY  \   # Host의 DISPLAY ID 전달 
--env QT_X11_NO_MITSHM=1 \ # OpenCV에서 DISPLAY 사용시 필요 
-v /home/kist-ubuntu/workspace:/root/workspace \   # 로컬 PC와 공유할 작업 공간 
-it <도커 이미지> \  # -it ; starts an interactive session
/bin/bash      # runs .bashrc file on startup
```


#### (추가)rviz,rqt, gazebo 등등 ROS관련 GUI도 docker로 실행하려면 
* [여기 링크](http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration) 참고 
* 
```bash
~$ xhost +  

~$ docker run 
--name <컨테이너 이름> \ 
--gpus=all \ 
--net=host \    # 로컬  PC의 IP와 동일하게 
--ipc=host \    # 컨테이너간 소켓통신
-v /tmp/.X11-unix:/tmp/.X11-unix:rw  \    # Host의 X-window 컨테이너의 X-window 연결 (volume mount)
--device=/dev/video0:/dev/video0 \     # Host의 카메라 장비를 컨테이너에 전달  
-e DISPLAY  \   # Host의 DISPLAY ID 전달 
--env QT_X11_NO_MITSHM=1 \ # OpenCV에서 DISPLAY 사용시 필요 
-v /home/kist-ubuntu/workspace:/root/workspace \   # 로컬 PC와 공유할 작업 공간 
-it <도커 이미지> \  # -it ; starts an interactive session
/bin/bash      # runs .bashrc file on startup
```



