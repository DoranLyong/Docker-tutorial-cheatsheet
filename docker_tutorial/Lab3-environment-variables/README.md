1. Inspect the environment variables set on the running container and identify the value set to the APP_COLOR variable
```bash
~$ docker inspect <container-name/container-id> 

# example 
~$ docker inspect 166abe02e032 | grep APP_COLOR

# then look for the values under Env.
```
2. Run a container named ```blue-app``` using image ```kodekloud/simple-webapp``` and set the environment variable ```APP_COLOR``` to ```blue```. Make the application available on port ```38282``` on the host. The application listens on port ```8080```.
``` bash
# Name: blue-app
# Image: kodekloud/simple-webapp
# ENV Variable: APP_COLOR=blue

~$ docker run -p 38282:8080 --name blue-app -e APP_COLOR=blue -d kodekloud/simple-webapp
```
3. View the application by clicking the link HOST:38282 above your terminal and ensure it has the right color
```bash
# APP_COLOR 가 제대로 설정 됐는지 확인
```
4. Deploy a ```mysql``` database using the ```mysql``` image and name it ```mysql-db```. <br/>
Set the database password to use ```db_pass123```. Lookup the mysql image on Docker Hub and identify the correct environment variable to use for setting the root password.
```bash
# Name: mysql-db
# Image: mysql
# Env: MYSQL_ROOT_PASSWORD=db_pass123

~$ docker run -d -e MYSQL_ROOT_PASSWORD=db_pass123 --name mysql-db mysql
```