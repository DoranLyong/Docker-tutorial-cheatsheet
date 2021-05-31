# Nvidia-docker GPU 할당하여 사용하기 

### 1. [Docker 설치](https://docs.docker.com/engine/install/ubuntu/)
* Check OS requirements 
* Uninstall old versions
* Install using the repository

### 2. Docker 설치 확인 
```bash
sudo docker version
```

### 3. [Root 권한 설정](https://blusky10.tistory.com/359) - sudo 없이 사용하기
```bash
sudo usermod -aG docker $USER #현재 접속중인 사용자에게 권한주기 
sudo usermod -aG docker your-user #your-user 사용자에게 권한주기
```

### 4. [Docker Compose 설치](https://docs.microsoft.com/ko-kr/visualstudio/docker/tutorials/use-docker-compose) - 다중 컨테이너 애플리케이션을 정의하고 공유할 수 있도록 개발된 도구
* [Install Docker Compose](https://docs.docker.com/compose/install/)

### 5. [Nvidia-docker 설치](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
* ```Setting up NVIDIA Container Toolkit``` 이 항목 따라하기 

### 6. nvidia-docker에서 사용할 이미지 받아오기 & 컨테이너 생성 
* 예시로 PyTorch 이미지를 만들어보자 → [docker hub에서 검색](https://hub.docker.com/r/pytorch/pytorch/tags?page=1&ordering=last_updated)
* 원하는 TAG의 이미지를 docker pull로 당겨오기 
* 반드시 devel 버전을 설치할 것 (runtime 버전은 nvcc 헤드가 없다) 
```bash
docker run --gpus all --net host -v [local PC 와 공유할 폴더] -dit [image:tag] /bin/bash   # 예시 

docker run --gpus all --net host -v /home/kist-ubuntu -dit pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel /bin/bash
```
  * ```--gpus all``` : pc에 설치된 gpu 장비에 모든 컨테이너가 접근가능하도록 해줌
  * ```--net host``` : 현재 pc 와 container 간 IP를 동일하게 함 ( ROS 때 편안, shared memory 도 local과 동일하게 사용 가능 )
  * ```-v [local PC 와 공유할 폴더]``` :  local PC의 디렉토리를 container의 어떤 디렉토리와 공유 (호스트와 컨테이너의 디렉토리를 연결 (마운트))
  * ```-dit``` : -d (detached mode, 백그라운드 모드), -it (-i와 -t를 동시에 사용한 것으로 터미널 입력을 위한 옵션)

<br/>

```-dit``` 로 실행시키면 생성된 컨테이너가 백그라운드에서 실행된 상태가 됨. 
* 이러면 따로 컨테이너를 켜는 명령어를 입력할 필요가 없음 - ```docker start [ContainerID or NAMES]```
* 


### 






***
### Reference 
[1] [Docker 설치 및 Nvidia docker로 GPU 사용하기 (feat. 자주쓰이는 명령어)](https://keyog.tistory.com/43) / <br/>
[2] [nvidia-docker GPU 할당하여 사용 하는 방법 3가지](https://kyumdoctor.co.kr/18) / <br/>
[3] [nvidia-docker, NVIDIA github](https://github.com/NVIDIA/nvidia-docker) / <br/>
[4] [nvidia-docker Installation Guide, docs.nvidia.com](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker) / <br/>


