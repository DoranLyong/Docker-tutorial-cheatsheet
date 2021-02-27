1. How many ```images``` are available on this host?
```bash 
~$ docker images 

# then count the number of available images.
```
2. What is the size of the ```Ubuntu``` image? (특정 도커 이미지의 메모리 사이즈)
```bash 
~$ docker images

# then look under the SIZE column
``` 
3. We just pulled a new image. What is the tag on the newly pulled ```nginx``` image?
```bash
~$ docker images 

# then look for the TAG column
```
4. We just downloaded the code of an application. What is the base image used in the Dockerfile?<br/>
Inspect the Dockerfile in the ```webapp-color``` directory.
```bash 
# You can either open the file using 
~$ vim /root/webapp-color/Dockerfile
#(or using comamnds such as cat/more/less/vim e.t.c) 

# then look for the FROM instruction or search for it directecly using
~$ grep -i FROM /root/webapp-color/Dockerfile
```
5. To what location within the container is the application code copied to during a Docker build? <br/>
Inspect the Dockerfile in the ```webapp-color``` directory.
```bash
# Open the Dockerfile 
# then  look for COPY command
~$ grep -i COPY /root/webapp-color/Dockerfile
```
6. When a container is created using the image built with this Dockerfile, what is the command used to ```RUN``` the application inside it. <br/>
Inspect the Dockerfile in the ```webapp-color``` directory.
```bash
# Open the Dockerfile 
# and look for ENTRYPOINT command
~$ grep -i ENTRYPOINT /root/webapp-color/Dockerfile
```
7. What ```port``` is the web application run within the container? <br/>
Inspect the Dockerfile in the ```webapp-color``` directory.
```bash
# Open the Dockerfile 
# and look for the port in EXPOSE command
~$ grep -i EXPOSE /root/webapp-color/Dockerfile
```
8. Build a docker image using the Dockerfile and name it ```webapp-color```.<br/> No tag to be specified.
```bash
# Image Name: webapp-color
~$ cd webapp-color  # 여기에 Dockerfile 이 있음 
~$ docker build -t webapp-color .
```
9. Run an instance of the image ```webapp-color``` and publish port ```8080``` on the container to ```8282``` on the host.
```bash
# Container with image 'webapp-color'
# Container Port: 8080
# Host Port: 8282

~$ docker run -p 8282:8080 webapp-color
```
10. Access the application by clicking on the tab named ```HOST:8282``` above your terminal.<br/>
After you are done, you may stop the running container by hitting CTRL + C if you wish to.
```bash
~$ 
```
11. What is the base Operating System used by the ```python:3.6``` image?<br/>
If required, run an instance of the image to figure it out.
```bash
~$ docker run python:3.6 cat /etc/*release* | grep ID 
```
12. What is the approximate size of the ```webapp-color``` image?
```bash
~$ docker images

# then look under SIZE => it was almost 900MB
```
13. That's really BIG(900MB) for a Docker Image. Docker images are supposed to be small and light weight. <br/>
Let us try to trim it down. Seeing below:

14. Build a new smaller docker image by modifying the same Dockerfile and name it ```webapp-color``` and tag it ```lite```. <br/>
Hint: Find a smaller base image for python:3.6. Make sure the final image is less than ```150MB```. (사이즈를 줄여서 이미지 새로 만들기)
```bash
# Name: webapp-color:lite
# Image size less than 150MB.

# Modify Dockerfile to use python:3.6-alpine image.
# then then build using
~$ cde webapp-color 
~$ vim ./Dockerfile 
~$ docker build -t webapp-color:lite .
```
15. Run an instance of the new image ```webapp-color:lite``` and publish port ```8080``` on the container to ```8383``` on the host.(이미지의 새로운 인스턴스 = 컨테이너 만들기)
```bash
# Container with image 'webapp-color:lite'
# Container to publish port 8080 to 8383
~$ docker run -p 8383:8080 webapp-color:lite
```