<p align="center">
  <a href="https://www.mov.ai/flow/"><img src="/docs/media/movai-flow-logo.jpg" alt="An IDE that introduces visualization and structure to ROS"></a>
</p>

<p align="center">
  <a href="https://github.com/MOV-AI/movai-flow/releases/latest"><img alt="CircleCI" src="https://img.shields.io/github/release/MOV-AI/movai-flow.svg?label=current+release"></a>
  <a href="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnGitRelease.yml"><img alt="Official Release" src="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnGitRelease.yml/badge.svg"></a>
  <a href="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnMergeMain.yml"><img alt="Pre Release" src="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnMergeMain.yml/badge.svg"></a>
  <a href="https://github.com/MOV-AI/movai-flow/actions/workflows/TestOnPR.yml"><img alt="PR Checks" src="https://github.com/MOV-AI/movai-flow/actions/workflows/TestOnPR.yml/badge.svg"></a>
  <a href="https://sonarcloud.io/summary/new_code?id=MOV-AI_movai-flow"><img alt="Quality Gate Status" src="https://sonarcloud.io/api/project_badges/measure?project=MOV-AI_movai-flow&metric=alert_status"></a>
  <a href="https://twitter.com/MovAIRobots"><img alt="Twitter" src="https://img.shields.io/twitter/url/http/shields.io.svg?style=social"></a>

</p>

<p align="center">
  <i>MOVAI Flow,</i> The IDE that introduces visualization and structure to ROS.
</p>


# Overview
An IDE that introduces visualization and structure to ROS. You can develop faster, understand ROS projects in an instant, and debug easily.

<p align="center">
    <a><img alt="Teaser2" src="https://media.giphy.com/media/O8EalLOaPKzDv8bp22/giphy.gif"></a>
</p>

## [MOV.AI Flow™](https://mov.ai/flow) brings many features to your ROS project development

| <img src="http://files.readme.io/77ed66f-movaiflow_feat1.png" width="400"/>|<img src="https://files.readme.io/7381cb9-feat2_fms.png" width="400"/> |
|:--:|:--:|
| *Web-based Visual ROS Editor* | *Built-in visual State machine and node orchestration* |
| <img src="https://files.readme.io/76e2705-feat3_callback.png" width="400"/>|<img src="https://files.readme.io/4543108-feat4_debug.png" width="400"/> |
| *Callback Editor* | *Visual Debugging* |
| <img src="https://files.readme.io/c6345de-flow_feat5_configs.png" width="400"/> | <img src="https://files.readme.io/91c9444-feat6_ros.png" width="400"/> |
| *Configuration Editor* | *Out-of-the-box Integration with the ROS Ecosystem*|

---
## Let's get started :smile:
### Supported Systems
Ubuntu [20.04 - x64](https://ubuntu.com/download/desktop/thank-you?version=20.04.4&architecture=amd64)

### Minimum Specs
- Disk 10 GB
- RAM 4 GB

### Recommended Specs
- Disk 20 GB
- RAM 8 GB
- NVIDIA GPU (For Ignition simulator)

### Install and configure requirements
Install the requirements by either following the respective links or copy paste the below commands into your terminal if you have the supported system mentioned above:

- docker > 20.10.8
  - [Install docker](https://docs.docker.com/engine/install/ubuntu/)
- docker-compose > 1.29.2
  - [Install docker-compose](https://docs.docker.com/compose/install/)
- Manage Docker as a non-root user
  - [Docker post install steps](https://docs.docker.com/engine/install/linux-postinstall)

```shell
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
```

### Install NVIDIA toolkit (optional but recommended for simulation)

- Do you have NVIDIA GPU? Install Docker NVIDIA's toolkit for HW acceleration
  - [Nvidia container toolkit installation](https://docs.nvidia.com/ai-enterprise/deployment-guide/dg-docker.html#enabling-the-docker-repository-and-installing-the-nvidia-container-toolkit)

```shell
#Add the package repositories:
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Download information from all configured sources about the latest versions of the packages and install the nvidia-container-toolkit package:
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit

#Restart the Docker service:
sudo systemctl restart docker
```

---

## Installation
#### Option A
- Download the debian file from the **Assets** section of the [latest releases page](https://github.com/MOV-AI/movai-flow/releases/latest)
- Click on the downloaded file in your browser or double click on the `movai-flow*.deb` file in your Downloads directory using a file explorer
- Enter your user password if there is a promt.
- Click the Install option. The Ubuntu Software Package Manager starts installing the downloaded app.

#### Option B
- Open a terminal
- Download the latest debian file
- Install it. Enter your user password if there is a promt.

```shell
# Install curl
sudo apt install curl
# Download and install the latest released debian pacakge
curl -s https://api.github.com/repos/MOV-AI/movai-flow/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | xargs curl -LJO
# Install, please make sure you have the correct file
sudo apt install ./movai-flow-1.2.0*.deb
```

## Usage
### Desktop shortcuts
Installing the Flow package will provide a few application shortcuts in the programming section:

<p align="center">
    <a><img alt="DesktopIcons" src="https://files.readme.io/bcc3fb7-three_icons.png"></a>
</p>

- MOV.AI Flow™: launches the needed services and then open a browser connected to the flow
- MOV.AI Flow™ RViz: launches rviz connected to the flow
- MOV.AI Flow™ Simulator: launches Ignition simulator connected to the flow

### CLI
Installing the MOV.AI Flow™ package will provide a few command line tools to control the cluster of containers running the flow:
- `movai-flow-launch`: launch this script to launch the needed services and then open a browser connected to the flow
- `movai-flow-stop`: stop all flow services
- `movai-flow-rviz`: launch rviz connected to the flow
- `movai-flow-simulator`: launch Ignition simulator connected to the flow


## MOV.AI Flow™ components

MOV.AI Flow™ initiates a set of services running as a *docker-compose* cluster, namely:

 - [redis-master](https://github.com/MOV-AI/containers-redis2): Master DB of the cluster
 - [redis-local](https://github.com/MOV-AI/containers-redis2): Local DB of the cluster
 - [backend](https://github.com/MOV-AI/backend): Web service application
 - [ros-master](https://github.com/MOV-AI/containers-ros-master): ROS core service
 - [spawner](https://github.com/MOV-AI/containers-spawner-base): Flow orchestrator of ROS and MOV.AI nodes
 - [haproxy](https://github.com/MOV-AI/containers-haproxy): Web proxy
 - [simulator](https://github.com/MOV-AI/containers-ign-simulator): Ignition Fortress container with graphical capabilities enabled
 - [ros-tools](https://github.com/MOV-AI/containers-ros-tools): RVIZ container with graphical capabilities enabled

> Some directories in the containers are mounted, which means that their contents are synchronized between your computer (host) and the container.

> Run `docker images` to check all downloaded images into your disk.
> Run `docker container ls` to  check current running containers

---

## Accessing the MOV.AI Flow™ IDE
After starting MOV.AI Flow™, you can interact with it via a browser using the web interface

Once the services have started up, you can log in to the web interface and try to run some tasks.
The webserver is available at: http://localhost:8080. The default account has both the username and the password: `movai`.

## Executing ROS commands
To get access to `rostopic` and `rosbag` commands, or to install/build more ros-packages, access the spawner container terminal by typing: `docker exec -it spawner-robot1 bash`

```
omen:~ $ docker exec -ti spawner-robot1 bash
./--/-`             -/--/.
:--//:.-`        `-.://:./   .-:::::::--  .:-          .:-       `:-
:`/-.`//:`      `://`.-/.: `//-```````-//` ./:.      .:-.:/.     `-.
:./-  -:/.:.  .:`//-  -/.: `//`       `//`  `:/-`  `:/-`  -/:`   -//
:.:-   `-:------:-`   -/./ `//.       .//`    .::../:.     `:/-  -//
::..     `-:///-`     ..::  .:/:::::::/:-      `-//-   .:-   ./:`-//
 ``         ``          `      ```````           ``     `      `  ``


 Copyright 2021 MOV.AI

    Licensed under the Mov.AI License version 1.0;
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.mov.ai/flow-license/

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

Welcome! Have fun!
movai@8245cb518b06:~/app$
```

## Documentation
Follow our [documentation](https://flow.mov.ai/docs) to get detailed information on getting familiar with the platform and how to setup your flows.

---

## Running from source code

Clone the repository or download the sources and follow the following instructions.

### Initializing Environment
Before starting MOV.AI Flow™ for the first time, You need to prepare your environment, i.e. create the necessary files, directories and initialize the database.

To do it, edit .env file and customize variables values:

    gedit .env

> Values present in the environment at runtime always override those defined inside the .env file. Similarly, values passed via command-line arguments take precedence as well.

### Running MOV.AI Flow™

Now you can start core services, by `cd`ing into the folder where `docker-compose.yml` is:

    docker-compose up -d

### Running ROS RViz

> The recommeded setup is to have an NVidia GPU,  but still an integrated Intel GPU can also work with lower performance

#### With Nvidia GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose-nvidia.yml up ros-tools

#### Without GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose.yml up ros-tools

### Accessing the Simulator
First of all be aware that the Simulator is based on the containerized [Ignition Fortress](https://ignitionrobotics.org/docs/fortress) application.

> The recommeded setup is to have an NVidia GPU,  but still an integrated Intel GPU can also work with lower performance

After starting MOV.AI Flow™, you can launch Ignition Fortress :

#### With Nvidia GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose-nvidia.yml up simulator

#### Without GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose.yml up simulator


### Cleaning up the environment
The docker-compose we prepare is a “Quick-start” one. It is not intended to be used in production and it has a number of caveats - one of them being that the best way to recover from any problem is to clean it up and restart from the scratch.

The best way to do it is to:

 - Run `docker-compose down --volumes --remove-orphans` command in the directory you downloaded the `docker-compose.yml` file

 - remove the whole directory where you downloaded the docker-compose.yaml file `rm -rf '<DIRECTORY>'`

 - re-download the docker-compose.yml file

 - re-start following the instructions from the very beginning in this guide


### Cleaning up for good
To stop and delete containers, delete volumes with database data and downloaded images, run:

    docker-compose down --volumes --rmi all
