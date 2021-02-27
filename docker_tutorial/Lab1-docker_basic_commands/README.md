1. What is the version of Docker Server Engine running on the Host? ```Look for the version of Server Engine```.
```bash
~$ docker version
```

2. How many containers are running on this host? ```Count the number of running containers```.
```bash
~$ docker ps  
```

3. How many images are available on this host? ```Count the number of available images```.
```bash
~$ docker images 
```
4. Run a container using the redis image. ```image:redis```. (내가 원하는 도커 이미지 실행)
``` bash 
~$ docker run <image-name> 
```
5. Stop the container you just created. ```Contrainer Stopped```. ( CTRL+C if you are on the container's terminal. Or else run below)
```bash
~$ docker stop <container-id>
```
6. How many containers are RUNNING on this host now? ``` Count the number of containers that are running```. (위에서 이미지를 실행해서 컨테이너를 만들고, 다시 컨테이너를 종료한 뒤에 현 상황은?)
```bash
~$ docker ps 
```
7. How many containers are PRESENT on the host now (Including both Running and Not Running ones)? 
```bash
~$ docker ps -a
```
8. What is the image used to run the ```nginx-1``` container? (예제 상에 나오는 컨테이너 이름)
```bash
~$ docker ps 

# then check under the IMAGE column
```
9. What is the name of the container created using the ```ubuntu``` image?
```bash 
~$ docker ps 

# then look at the NAMES column
```
10. What is the ID of the container that uses the ```alpine``` image and is ```not running```?
```bash 
~$ docker ps -a 

# then identify the ID of the container that uses alpine image
```
11. What is the state of the stopped ```alpine ```container?
```bash 
~$ docker ps -a 

# then loo at the STATUS column
```
12. Delete all containers from the Docker Host (both ```Running``` and ```Not Running``` ones). Remember you may have to stop containers before deleting them. 
```bash 
# To stop containers
~$  docker stop <container id | container name>

# then delete them 
~$ docker rm <container id | container name>
```
13. Delete the ```ubuntu``` Image. (해당 이미지를 참조해서 생성된 컨테이너는 12번 예제에서 제거 되어야 됨)
```bash 
# 참조된 컨테이너는 제거된 상태에서 진행(remove image)
~$ docker rmi ubuntu   
```
14. You are required to pull a docker image which will be used to run a container later. Pull the image ```nginx:1.14-alpine```. (Only pull the image, do not create a container.)
```bash 
~$ docker pull nginx:1.14-alpine

# 이러면 docker hub 에서 이미지를 다운 받음 
```
15. Run a container with the ```nginx:1.14-alpine``` image and name it ```webapp```.
```bash
# Container created 
# Nmae:webapp

~$ docker run --name webapp nginx:1.14-alpine
```
16. Cleanup: Delete all images on the host. Remove containers as necessary. ([refer to](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes))
```bash 
# Remove all images 

~$ docker rmi $(docker images -a -q)
```