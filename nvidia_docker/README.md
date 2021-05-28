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

### 5. nvidia-docker에서 사용할 이미지 받아오기 
* 예시로 PyTorch 이미지를 만들어보자 → [docker hub에서 검색](https://hub.docker.com/r/pytorch/pytorch/tags?page=1&ordering=last_updated)
* 원하는 TAG의 이미지를 docker pull로 당겨오기 
* 반드시 devel 버전을 설치할 것 (runtime 버전은 nvcc 헤드가 

### 6. [Nvidia-docker 설치](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
* ```Setting up NVIDIA Container Toolkit``` 이 항목 따라하기 



***
### Reference 
[1] [Docker 설치 및 Nvidia docker로 GPU 사용하기 (feat. 자주쓰이는 명령어)](https://keyog.tistory.com/43) / <br/>
[2] [nvidia-docker GPU 할당하여 사용 하는 방법 3가지](https://kyumdoctor.co.kr/18) / <br/>
[3] [nvidia-docker, NVIDIA github](https://github.com/NVIDIA/nvidia-docker) / <br/>
[4] [nvidia-docker Installation Guide, docs.nvidia.com](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker) / <br/>


