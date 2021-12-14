# ce-project-studio
Community Edition - MOVAI Studio Project Resources

## Before you begin
Follow these steps to install the necessary tools:

- Install Docker Community Edition (CE) on your workstation. Depending on the OS, you may need to configure your Docker instance to use 4.00 GB of memory for all containers to run properly. Please refer to the Resources section if using Docker for Windows or Docker for Mac for more information.

- Install Docker Compose v1.29.1 and newer on your workstation.

> Older versions of `docker-compose` do not support all the features required by `docker-compose.yml` file, so double check that your version meets the minimum version requirements.

- Login to MOV.AI Docker registry:

    ```shell
    docker login registry.cloud.mov.ai -u username
    ```


## docker-compose.yml
This file contains several service definitions:
 - redis-master
 - redis-local
 - backend
 - influxdb
 - health-node
 - ros-master
 - spawner
 - haproxy
 - movai-cli
 - simulator

> Some directories in the container are mounted, which means that their contents are synchronized between your computer and the container.

## Initializing Environment
Before starting MOVAI Studio for the first time, You need to prepare your environment, i.e. create the necessary files, directories and initialize the database.

To do it, edit .env file and customize variables values:

    gedit .env

> Values present in the environment at runtime always override those defined inside the .env file. Similarly, values passed via command-line arguments take precedence as well.

## Running MOVAI Studio
Now you can start all services:

    docker-compose up -d

> The account created has the login `movai` and the password `movai`.


## Cleaning-up the environment
The docker-compose we prepare is a “Quick-start” one. It is not intended to be used in production and it has a number of caveats - one of them being that the best way to recover from any problem is to clean it up and restart from the scratch.

The best way to do it is to:

 - Run `docker-compose down --volumes --remove-orphans` command in the directory you downloaded the `docker-compose.yml` file

 - remove the whole directory where you downloaded the docker-compose.yaml file `rm -rf '<DIRECTORY>'`

 - re-download the docker-compose.yml file

 - re-start following the instructions from the very beginning in this guide

## Accessing the Studio
After starting MOVAI Studio, you can interact with it in different ways:

- via a browser using the web interface.
- using the REST API.
- by running CLI commands.
- by running the Simulator
- by running the ROS tools rviz

### Accessing the web interface
Once the cluster has started up, you can log in to the web interface and try to run some tasks.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

### Sending requests to the REST API
Basic username password authentication is currently supported for the REST API, which means you can use common tools to send requests to the API.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

Here is a sample curl command, which sends a request to ...:

    ENDPOINT_URL="http://localhost:8080/"
    curl -X GET  \
        --user "movai:movai" \
        "${ENDPOINT_URL}/api/v1/..."


### Running the CLI commands
You can also run CLI commands, but you have to do it in one of the defined docker-compose services.

For example, to run `movai-cli list`, run the following command:

    docker-compose exec movai-cli movai-cli list

### Accessing the Simulator
First of all:

Install NVIDIA-DOCKER service to enable GPU resources inside the container:

    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
    && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
    && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update
    sudo apt-get install -y nvidia-docker2

Restart the docker service:

    sudo systemctl restart docker

After starting MOVAI Studio, you can launch Ignition Fortress:

    xhost +local:docker
    docker-compose up simulator

### Accessing ROS tools rviz

    xhost +local:docker
    docker-compose up ros-tools


### Accessing the web interface
Once the cluster has started up, you can log in to the web interface and try to run some tasks.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

### Sending requests to the REST API
Basic username password authentication is currently supported for the REST API, which means you can use common tools to send requests to the API.

The webserver is available at: http://localhost:8080. The default account has the login `movai` and the password `movai`.

Here is a sample curl command, which sends a request to ...:

    ENDPOINT_URL="http://localhost:8080/"
    curl -X GET  \
        --user "movai:movai" \
        "${ENDPOINT_URL}/api/v1/..."


### Cleaning up
To stop and delete containers, delete volumes with database data and download images, run:

    docker-compose down --volumes --rmi all

## Using it as a service

The package creates a systemd service that autostarts & manages the MOVAI Studio docker-compose instance

After the service is created, it can be controlled as follow :

    ```shell
    echo "Enabling & starting $SERVICENAME"
    # Autostart systemd service
    sudo systemctl enable $SERVICENAME.service
    # Start systemd service now
    sudo systemctl start $SERVICENAME.service
    # Stop systemd service now
    sudo systemctl stop $SERVICENAME.service
    ```

## Creating a package

    dpkg-buildpackage
