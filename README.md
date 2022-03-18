# ce-project-flow
Community Edition - MOVAI Flow Project Resources

## Before you begin
Follow these steps to install the necessary tools:

- Install Docker Community Edition (CE) on your workstation. Depending on the OS, you may need to configure your Docker instance to use 4.00 GB of memory for all containers to run properly. Please refer to the Resources section if using Docker for Windows or Docker for Mac for more information.

- Install Docker Compose v1.29.1 and newer on your workstation.

> Older versions of `docker-compose` do not support all the features required by `docker-compose.yml` file, so double check that your version meets the minimum version requirements.

- Login to MOV.AI Docker registry:

    ```shell
    docker login registry.cloud.mov.ai -u username
    ```

## Install MOVAI Flow

> Important Notes :
>
>  - current version is only tested on Ubuntu 20.04 / Debian
>  - current version is only tested with NVidia GPU

Retrieve the `movai-flow` package by downloading it from GitHub releases and then using Linux package manager.

Or `movai-flow` package is also available from our repository :

```shell
curl -fsSL https://artifacts.cloud.mov.ai/repository/movai-applications/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=all] https://artifacts.cloud.mov.ai/repository/ppa-main main main"
sudo apt-get install movai-flow
```

## Controls of MOVAI Flow
Installing the Flow package will provide a few application shortcuts in the programming section:
- `MOV.AI Flow`: launches the needed services and then open a browser connected to the flow
- `MOV.AI Flow RViz`: launches rviz connected to the flow
- `MOV.AI Flow Simulator`: launches Ignition simulator connected to the flow

Installing the Flow package will provide a few command line tools to control the cluster of containers running the flow:
- `movai-flow-launch`: launch this script to launch the needed services and then open a browser connected to the flow
- `movai-flow-stop`: stop all flow services
- `movai-flow-rviz`: launch rviz connected to the flow
- `movai-flow-simulator`: launch Ignition simulator connected to the flow


## Services of MOVAI Flow
The flow initiate a set of services running as a `docker-compose` cluster:
 - redis-master: master DB of the cluster
 - redis-local: local DB of the cluster
 - backend: web service application
 - influxdb: timeseries DB storing metrics
 - health-node: web service application for metrics and logs
 - ros-master: ROS core service
 - spawner: MOVAI flow orchestrator of ROS nodes
 - haproxy: web proxy
 - simulator: Ignition Fortress container with graphical capabilities enabled
 - ros-tools: rviz container with graphical capabilities enabled

> Some directories in the containers are mounted, which means that their contents are synchronized between your computer and the container.

## Importing ROS package

A folder configured as a ROS wokspace is shared in between the host and the cluster,
by default it is located in `/usr/share/movai-flow/userspace/` but a link is added to `~/Documents/MovaiFlow`

- Place any ROS package in the ROS workspace as follow :

"""
    mkdir -p /usr/share/movai-flow/userspace/cache/ros/src
    cd /usr/share/movai-flow/userspace/cache/ros/src
    git clone git@github.com:ros/resource_retriever.git
"""

- run compilation script inside the cluster:

"""
    docker exec -it spawner-flow ros1-workspace-build.sh
"""

The package generated artifacts should them be available in MOV.AI Flow



## Installing the Flow from sources

Clone the repository or download the sources and follow the following instructions.

### Initializing Environment
Before starting MOVAI Flow for the first time, You need to prepare your environment, i.e. create the necessary files, directories and initialize the database.

To do it, edit .env file and customize variables values:

    gedit .env

> Values present in the environment at runtime always override those defined inside the .env file. Similarly, values passed via command-line arguments take precedence as well.

### Running MOVAI Flow
Now you can start core services:

    docker-compose up -d

> The account created has the login `movai` and the password `movai`.


### Cleaning-up the environment
The docker-compose we prepare is a “Quick-start” one. It is not intended to be used in production and it has a number of caveats - one of them being that the best way to recover from any problem is to clean it up and restart from the scratch.

The best way to do it is to:

 - Run `docker-compose down --volumes --remove-orphans` command in the directory you downloaded the `docker-compose.yml` file

 - remove the whole directory where you downloaded the docker-compose.yaml file `rm -rf '<DIRECTORY>'`

 - re-download the docker-compose.yml file

 - re-start following the instructions from the very beginning in this guide

### Accessing the Flow
After starting MOVAI Flow, you can interact with it in different ways:

- via a browser using the web interface
- using the REST API
- by running the Simulator
- by running the ROS tools rviz

#### Accessing the web interface
Once the cluster has started up, you can log in to the web interface and try to run some tasks.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

#### Sending requests to the REST API
Basic username password authentication is currently supported for the REST API, which means you can use common tools to send requests to the API.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

Here is a sample curl command, which sends a request to ...:

    ENDPOINT_URL="http://localhost:8080/"
    curl -X GET  \
        --user "movai:movai" \
        "${ENDPOINT_URL}/api/v1/..."

#### Accessing the Simulator
First of all be aware that the Simulator is based on the containerized [Ignition Fortress](https://ignitionrobotics.org/docs/fortress) application.

> The recommeded setup is to have an NVidia GPU  but still an integrated Intel GPU can also work with lower performance

##### With Nvidia GPU
Install NVIDIA-DOCKER service to enable GPU resources inside the container:

    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
    && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
    && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update
    sudo apt-get install -y nvidia-docker2

Restart the docker service:

    sudo systemctl restart docker

After starting MOVAI Flow, you can launch Ignition Fortress with Nvidia GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose-nvidia.yml up simulator

##### With generic GPU

After starting MOVAI Flow, you can launch Ignition Fortress without GPU acceleration:

    xhost +local:docker
    docker-compose -f docker-compose.yml up simulator

#### Accessing ROS tools rviz

With Nvidia GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose-nvidia.yml up ros-tools

Without GPU acceleration :

    xhost +local:docker
    docker-compose -f docker-compose.yml up ros-tools


#### Accessing the web interface
Once the cluster has started up, you can log in to the web interface and try to run some tasks.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

#### Sending requests to the REST API
Basic username password authentication is currently supported for the REST API, which means you can use common tools to send requests to the API.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

Here is a sample curl command, which sends a request to ...:

    ENDPOINT_URL="http://localhost:8080/"
    curl -X GET  \
        --user "movai:movai" \
        "${ENDPOINT_URL}/api/v1/..."


#### Cleaning up
To stop and delete containers, delete volumes with database data and download images, run:

    docker-compose down --volumes --rmi all

### Using the Flow as a service

The package creates a systemd service that autostarts & manages the MOVAI Flow docker-compose instance

After the service is created, it can be controlled as follow :

    ```shell
    echo "Enabling & starting movai-flow"
    # Autostart systemd service
    sudo systemctl enable movai-flow.service
    # Start systemd service now
    sudo systemctl start movai-flow.service
    # Stop systemd service now
    sudo systemctl stop movai-flow.service
    ```

### Creating a debian package

    dpkg-buildpackage

## Importing ROS package

A folder configured as a ROS wokspace is shared in between the host and the cluster,
by default it is located in `/usr/share/movai-flow/userspace/`.

- Place any ROS package in the ROS workspace as follow :

"""
    mkdir -p /usr/share/movai-flow/userspace/cache/ros/src
    cd /usr/share/movai-flow/userspace/cache/ros/src
    git clone git@github.com:ros/resource_retriever.git
"""

- run compilation script inside the cluster:

"""
    docker exec -it spawner-flow ros1-workspace-build.sh
"""

The package generated artifacts should them be available in MOV.AI Flow

