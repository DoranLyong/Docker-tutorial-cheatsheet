1. Let us first inspect the environment. How many containers are running on this host?
```bash
~$ docker ps 

# then count the number of running containers.
```
2. What is the image used by the container?
```bash 
~$ docker ps 

# then look under the IMAGE column.
```
3. How many ports are published on this container?
```bash
~$ docker ps 

# then look under the PORTS column
```
4. Which of the below ports are the exposed on the ```CONTAINER```?
```bash
~$ docker ps 

# then look under the PORTS column.
# Ports on the right(after ->) are exposed on the container
```
5. Which of the below ports are published on ```Host```?
```bash
~$ docker ps 

# look under the PORTS column.
# Ports on the left(before ->) are published on the host
```
6. Run an instance of ```kodekloud/simple-webapp``` with a tag ```blue``` and map port 8080 on the container to 38282 on the host.
```bash
# Image: kodekloud/simple-webapp:blue
# Container port 8080
# Host Port: 38282

~$ docker run -p 38282:8080 kodekloud/simple-webapp:blue
```