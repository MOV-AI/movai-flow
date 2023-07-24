<p align="center">
  <a href="https://www.mov.ai/flow/"><img src="/docs/media/movai-flow-logo.jpg" alt="An IDE that introduces visualization and structure to ROS"></a>
</p>

<p align="center">
  <a href="http://wiki.ros.org/noetic"><img alt="ROS1-Noetic" src="https://img.shields.io/badge/ROS1-Noetic-green?"></a>
  <a href="https://github.com/MOV-AI/movai-flow/releases/latest"><img alt="CircleCI" src="https://img.shields.io/github/release/MOV-AI/movai-flow.svg?label=current+release"></a>
  <a href="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnGitRelease.yml"><img alt="Official Release" src="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnGitRelease.yml/badge.svg"></a>
  <a href="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnMergeMain.yml"><img alt="Pre Release" src="https://github.com/MOV-AI/movai-flow/actions/workflows/DeployOnMergeMain.yml/badge.svg"></a>
  <a href="https://github.com/MOV-AI/movai-flow/actions/workflows/TestOnPR.yml"><img alt="PR Checks" src="https://github.com/MOV-AI/movai-flow/actions/workflows/TestOnPR.yml/badge.svg"></a>
  <a href="https://sonarcloud.io/summary/new_code?id=MOV-AI_movai-flow"><img alt="Quality Gate Status" src="https://sonarcloud.io/api/project_badges/measure?project=MOV-AI_movai-flow&metric=alert_status"></a>
  <a href="https://twitter.com/MovAIRobots"><img alt="Twitter" src="https://img.shields.io/twitter/url/http/shields.io.svg?style=social"></a>

</p>

<p align="center">
  <i>MOV.AI Flow™,</i> The IDE that introduces visualization and structure to ROS.
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
# Installation

Please follow our [installation procedure in the documentation](https://flow.mov.ai/docs/installation).

---

# Usage
You can find an overview of icons and CLI for launching the installed software. Follow our [readme page](https://flow.mov.ai/docs/launching-movai-1) for a detailed explanation.

## Modes of operation: host vs isolated network
MOV.AI Flow™ Can run between two modes at a given time. The host mode and the isolated mode. Please find the details of both in our [documentation website](https://flow.mov.ai/docs/running-modes-host-vs-isolated-network).

## Desktop shortcuts
Installing the Flow package will provide a few application shortcuts in the programming section:

<p align="center">
    <a><img alt="DesktopIcons" src="https://files.readme.io/bcc3fb7-three_icons.png"></a>
</p>

- MOV.AI Flow™: launches the needed services and then opens a browser connected to the flow
- MOV.AI Flow™ RViz: launches rviz connected to the flow
- MOV.AI Flow™ Simulator: launches Ignition simulator connected to the flow

## CLI
Installing the MOV.AI Flow™ package will provide a few command line tools to control the cluster of containers running the flow:
- `movai-flow-launch`: launch this script to launch the needed services and then open a browser connected to the flow
- `movai-flow-stop`: stop all flow services
- `movai-flow-rviz`: launch rviz connected to the flow
- `movai-flow-simulator`: launch Ignition simulator connected to the flow


# MOV.AI Flow™ components (docker)

MOV.AI Flow™ initiates a set of docker containers orchestrated using *docker-compose*, namely:

 - [backend](https://github.com/MOV-AI/backend): Web service application
   - [backend source code](https://github.com/MOV-AI/backend): Source code for backend application.
   - [frontend source code](https://github.com/MOV-AI/frontend-npm-ce-suite): Source code for our frontend application.
 - [spawner](https://github.com/MOV-AI/containers-spawner-base): Flow orchestrator container of ROS and MOV.AI nodes.
   - [flow initiator](https://github.com/MOV-AI/flow-initiator): Source code for our flow initiator.
   - [movai ce demos](https://github.com/MOV-AI/movai_ce_demos): Source code for the demos.
   - [movai ign sim packages](https://github.com/MOV-AI/movai_ign_sim_ce_pkgs): Source code for simulator driver package.
   - [movai ports and messages](https://github.com/MOV-AI/movai_ports_and_messages_ce): Metadata list of supports protocols and messages.
  - [redis-master](https://github.com/MOV-AI/containers-redis2): Master DB of the cluster.
  - [redis-local](https://github.com/MOV-AI/containers-redis2): Local DB of the cluster.
  - [simulator](https://github.com/MOV-AI/containers-ign-simulator): Ignition Fortress container with graphical capabilities enabled.
    - [movai-ign-plugin-world-launcher](https://github.com/MOV-AI/movai_ign_plugins): GUI Plugin to select and launch the worlds.
  - [ros-master](https://github.com/MOV-AI/containers-ros-master): ROS core service.
  - [ros-tools](https://github.com/MOV-AI/containers-ros-tools): RVIZ container with graphical capabilities enabled
  - [haproxy](https://github.com/docker-library/haproxy): Web proxy.

> Some directories in the containers are mounted, which means that their contents are synchronized between your computer (host) and the container.

> Run `docker images` to check all downloaded images into your disk.
> Run `docker container ls` to  check current running containers

---

# Accessing the MOV.AI Flow™ IDE
After starting MOV.AI Flow™, you can interact with it via a browser using the web interface

Once the services have started up, you can log in to the web interface and try to run some tasks.
The web server is available at http://localhost:8080. The default account has both the username and the password: `movai`.

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

# Running from source code

Clone the repository or download the sources and follow the following instructions.

`git clone `

## Initializing Environment
Before starting MOV.AI Flow™ for the first time, You need to prepare your environment, i.e. create the necessary files, directories and initialize the database.

To do it, edit the .env file and customize variables values:

    gedit .env

> Values in the environment at runtime always override those defined inside the .env file. Similarly, values passed via command-line arguments take precedence as well.

## Running MOV.AI Flow™

### Setting the essential environment vars
To use the scripts that are available in the `scripts/` directory we should first set the APP_PATH environment variable

First `cd` into your cloned repository, then set the APP_PATH by running the below command:
```
export APP_PATH=$(pwd)
```

## Starting the IDE

It is recommended to start the services using the scripts provided in the scripts directory rather than the docker-compose. The scripts provide pre and post-steps that are required for the project. In the end, the script uses the docker-compose to start the services.

Now you can start core services, using the movai-flow-launch script

```bash
bash ./scripts/movai-flow-launch
```

## Stopping the IDE
Using the provided script you can stop the services that were started in the [previous section](#starting-the-ide).

```bash
bash ./scripts/movai-flow-stop
```

## Running ROS RViz

> The recommended setup is to have an NVidia GPU,  but still, an integrated Intel GPU can also work with lower performance.

```bash
xhost +local:docker
bash ./scripts/movai-flow-rviz
```
## Running the Simulator
First of all, be aware that the Simulator is based on the containerized [Ignition Fortress](https://ignitionrobotics.org/docs/fortress) application.

> The recommended setup is to have an NVidia GPU,  but still, an integrated Intel GPU can also work with lower performance

After starting MOV.AI Flow™, you can launch Ignition Fortress :

```bash
xhost +local:docker
bash ./scripts/movai-flow-simulator
```

## Cleaning up the environment
The docker-compose we prepare is a “Quick-start” one. It is not intended to be used in production and it has a number of caveats - one of them being that the best way to recover from any problem is to clean it up and restart from scratch using the reset script.

```bash
bash ./scripts/movai-flow-reset
```

## Cleaning up permanently
To remove the downloaded images as well, run:

```bash
bash ./scripts/movai-flow-reset --all
```
