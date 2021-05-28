# Nvidia-docker GPU 할당하여 사용하기 

### 1. [Docker 설치](https://docs.docker.com/engine/install/ubuntu/)
* Check OS requirements 
* Uninstall old versions
* Install using the repository

### 2. [Root 권한 설정](https://blusky10.tistory.com/359) - sudo 없이 사용하기
```bash
sudo usermod -aG docker $USER #현재 접속중인 사용자에게 권한주기 
sudo usermod -aG docker your-user #your-user 사용자에게 권한주기
```





***
### Reference 
[1] [Docker 설치 및 Nvidia docker로 GPU 사용하기 (feat. 자주쓰이는 명령어)](https://keyog.tistory.com/43) / <br/>
[2] [nvidia-docker GPU 할당하여 사용 하는 방법 3가지](https://kyumdoctor.co.kr/18) / <br/>
[3] [nvidia-docker, NVIDIA github](https://github.com/NVIDIA/nvidia-docker) / <br/>
[4] [nvidia-docker Installation Guide, docs.nvidia.com](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker) / <br/>


