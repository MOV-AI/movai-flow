# MOV.AI Flow&trade; 
### An IDE that introduces visualization and `structure to ROS_`
You can develop faster, understand ROS projects in an instant, and debug easily.

![teaser2](https://media.giphy.com/media/O8EalLOaPKzDv8bp22/giphy.gif)

MOV.AI Flow™  brings many features to your ROS project development:

| <img src="http://files.readme.io/77ed66f-movaiflow_feat1.png" width="400"/>|<img src="https://files.readme.io/7381cb9-feat2_fms.png" width="400"/> | 
|:--:|:--:|
| *Web-based Visual ROS Editor* | *Built-in visual State machine and node orchestration* |
| <img src="https://files.readme.io/76e2705-feat3_callback.png" width="400"/>|<img src="https://files.readme.io/4543108-feat4_debug.png" width="400"/> | 
| *Callback Editor* | *Visual Debugging* |
| <img src="https://files.readme.io/c6345de-flow_feat5_configs.png" width="400"/> | <img src="https://files.readme.io/91c9444-feat6_ros.png" width="400"/> |
| *Configuration Editor* | *Out-of-the-box Integration with the ROS Ecosystem*|



## Supported Systems
Ubuntu [20.04 - x64](https://ubuntu.com/download/desktop/thank-you?version=20.04.4&architecture=amd64)

### Minimum Specs
- Disk 10 GB
- RAM 4 GB

### Recommended Specs
- Disk 20 GB
- RAM 8 GB
- NVIDIA GPU (For Ignition simulator)


## Before you begin
### Needed Software

- `docker > 20.10.8`
- `docker-compose > 1.29.2`
- [Instructions](https://docs.docker.com/engine/install/ubuntu/)

### Setup

- Manage Docker as a non-root user [(Instructions)](https://docs.docker.com/engine/install/linux-postinstall)
- Do you have NVIDIA GPU? Install Docker NVIDIA's toolkit for HW acceleration [(Instructions)](https://docs.nvidia.com/ai-enterprise/deployment-guide/dg-docker.html#enabling-the-docker-repository-and-installing-the-nvidia-container-toolkit)
- While the SW is not public, you need to do docker login after installing Docker.




### Just give me some steps! 

```
sudo apt update && sudo apt upgrade
sudo apt install curl
# docker 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -sc) stable"
sudo apt -y install docker-ce docker-ce-cli 
# docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# docker sudo group
sudo groupadd docker
sudo gpasswd -a $USER docker 
docker login registry.cloud.mov.ai -u movaiflowtester
<Password: ask for it community@mov.ai>
```

NVIDIA GPU support

```
#Add the package repositories:
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Download information from all configured sources about the latest versions of the packages and install the nvidia-container-toolkit package:
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit

#Restart the Docker service:
sudo systemctl restart docker
```


# Installing MOV.AI Flow&trade;
## Download 
-  Download the [latest release](https://github.com/MOV-AI/movai-flow/releases/latest/download) .deb file


## Install
Option A)
1. Open a Terminal, `cd` into downloads folder, and type `sudo dpkg -i ./movai-flow*.deb`
1. Enter your user password in the prompt. The installation should then execute, provide debugging information, and complete. 
 
Option B)
1. Go to the Downloads folder.
1. Double-click on it to launch it. 
1. Click the Install option. The Ubuntu Software Package Manager starts installing the downloaded app. 





# Getting Started

## Shortcuts
Installing the Flow package will provide a few application shortcuts in the programming section:
- `MOV.AI Flow`: launches the needed services and then open a browser connected to the flow
- `MOV.AI Flow RViz`: launches rviz connected to the flow
- `MOV.AI Flow Simulator`: launches Ignition simulator connected to the flow

![](https://files.readme.io/bcc3fb7-three_icons.png)

## CLI
Installing the Flow package will provide a few command line tools to control the cluster of containers running the flow:
- `movai-flow-launch`: launch this script to launch the needed services and then open a browser connected to the flow
- `movai-flow-stop`: stop all flow services
- `movai-flow-rviz`: launch rviz connected to the flow
- `movai-flow-simulator`: launch Ignition simulator connected to the flow

## Accessing the Flow&trade; IDE
After starting MOVAI Flow&trade;, you can interact with it in different ways:

- via a browser using the web interface
- ~~using the REST API~~

Once the services have started up, you can log in to the web interface and try to run some tasks.
The webserver is available at: http://localhost:8080. The default account has both the username and the password: `movai`.

## Accessing ROS *terminal* 
To get access to `rostopic` and `rosbag` commands, or to install/build more ros-packages, access the ROS *terminal* typing:

`docker exec -it spawner-robot1 bash`

![docker_bash](https://files.readme.io/c451bb9-docker_spawer_bash.png)

# More Info

Flow&trade; initiates a set of services running as a `docker-compose` cluster, namely:

 - redis-master: master DB of the cluster
 - redis-local: local DB of the cluster
 - backend: web service application
 - ros-master: ROS core service
 - spawner: MOVAI flow orchestrator of ROS nodes
 - haproxy: web proxy
 - simulator: Ignition Fortress container with graphical capabilities enabled
 - ros-tools: rviz container with graphical capabilities enabled

> Some directories in the containers are mounted, which means that their contents are synchronized between your computer (host) and the container.

> Run `docker images` to check all downloaded images into your disk.
> Run `docker container ls` to  check current running containers



## Installing the Flow from sources

Clone the repository or download the sources and follow the following instructions.

### Initializing Environment
Before starting MOVAI Flow for the first time, You need to prepare your environment, i.e. create the necessary files, directories and initialize the database.

To do it, edit .env file and customize variables values:

    gedit .env

> Values present in the environment at runtime always override those defined inside the .env file. Similarly, values passed via command-line arguments take precedence as well.

### Running MOVAI Flow

Now you can start core services, by `cd`ing into the folder where `docker-compose.yml` is:

    docker-compose up -d

### Running ROS RViz

> The recommeded setup is to have an NVidia GPU,  but still an integrated Intel GPU can also work with lower performance

##### With Nvidia GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose-nvidia.yml up ros-tools

##### Without GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose.yml up ros-tools

### Accessing the Simulator
First of all be aware that the Simulator is based on the containerized [Ignition Fortress](https://ignitionrobotics.org/docs/fortress) application.

> The recommeded setup is to have an NVidia GPU,  but still an integrated Intel GPU can also work with lower performance

##### With Nvidia GPU

After starting MOVAI Flow, you can launch Ignition Fortress with Nvidia GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose-nvidia.yml up simulator
    
##### Without GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose.yml up simulator


### Cleaning-up the environment
The docker-compose we prepare is a “Quick-start” one. It is not intended to be used in production and it has a number of caveats - one of them being that the best way to recover from any problem is to clean it up and restart from the scratch.

The best way to do it is to:

 - Run `docker-compose down --volumes --remove-orphans` command in the directory you downloaded the `docker-compose.yml` file

 - remove the whole directory where you downloaded the docker-compose.yaml file `rm -rf '<DIRECTORY>'`

 - re-download the docker-compose.yml file

 - re-start following the instructions from the very beginning in this guide


### Cleaning up for good
To stop and delete containers, delete volumes with database data and downloaded images, run:

    docker-compose down --volumes --rmi all
