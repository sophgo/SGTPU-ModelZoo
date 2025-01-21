# SGTPU-ModelZoo

## 目录
- [安装指南](#安装指南)
- [快速开始](#快速开始)
- [目录结构](#目录结构)
- [资料链接](#资料链接)


## 安装指南
### 1. 安装 tpu-mlir
首先检查当前系统环境是否满足 ubuntu 22.04 和 python 3.10。如不满足，请进行下一节 [基础环境配置](#10-基础环境配置) ；如满足，直接跳至 [tpu-mlir 安装](#1.1 tpu-mlir 安装) 。
#### 1.0 基础环境配置
如不满足上述系统环境，则需要使用Docker，从 DockerHub https://hub.docker.com/r/sophgo/tpuc_dev 下载所需的镜像文件，或使用下方命令直接拉取镜像：

```bash
$ docker pull sophgo/tpuc_dev:v3.2
```
若下载失败，可从[官网开发资料](https://developer.sophgo.com/site/index/material/86/all.html) 下载所需镜像文件，或使用下方命令下载镜像：
```bash
$ wget https://sophon-file.sophon.cn/sophon-prod-s3/drive/24/06/14/12/sophgo-tpuc_dev-v3.2_191a433358ad.tar.gz
$ docker load -i sophgo-tpuc_dev-v3.2_191a433358ad.tar.gz
```
如果是首次使用Docker, 可执行下述命令进行安装和配置（仅首次执行）：
```bash
$ sudo apt install docker.io
$ sudo systemctl start docker
$ sudo systemctl enable docker
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
$ newgrp docker
```
若下载镜像文件，则需要确保镜像文件在当前目录，并在当前目录创建容器如下:
```bash
$ docker run --privileged --name myname -v $PWD:/workspace -it sophgo/tpuc_dev:v3.2
```
其中， ```myname``` 为容器名称, 可以自定义； ```$PWD``` 为当前目录，与容器的 ```/workspace ```目录同步。

此时假定用户已经处于 docker 里面的```/workspace```目录。

#### 1.1 tpu-mlir 安装

克隆仓库
```bash
git clone https://github.com/sophgo/tpu-mlir.git
```
源码编译
```bash
cd tpu-mlir
git checkout sgtpuv8
source ./envsetup.sh
./build.sh
```



## 快速开始

### 模型下载
克隆本仓库默认不会下载模型，需要利用 git-lfs 下载模型。首先下载 GitLFS
```bash
pip install git-lfs
```
下载具体的模型：
```bash
git lfs pull --include="path/to/model" --exclude=""
```
```path/to/model```指的是[模型位置](#模型导航)，比如```yolov5s```模型的路径是 ```vision/classification/yolov5s```。```--exclude==""```表示不排除任何文件，确保所有匹配的都会被下载。

下载所有文件：
```bash
git lfs pull --include="*" --exclude=""
```

### 模型转换

利用shell脚本将对应的onnx文件转换为 INT8 格式的bmodel文件，具体操作是：

打开具体模型所在的目录，比如 ```yolov5s```模型在 ```SGTPU-ModelZoo/vision/classification/yolov5s/```，利用转换文件转换 ```yolov5s.onnx``` 文件
```bash
bash convert.sh
```


### 模型导航
|Model                            |Path                                                                                                  |NNTC                |MLIR                |
|:-                               |:-                                                                                                    |:-                  |:-                  |
|mobilenetv2                          |[vision/classification/mobilenetv2](vision/classification/mobilenetv2)                            |                    |                    |
|resnet50_v2                          |[vision/classification/resnet50_v2](vision/classification/resnet50_v2)                            |                    |                    |
|squeezenet_v1.1             |[vision/classification/squeezenet_v1.1](vision/classification/squeezenet_v1.1)  |                    |                    |
|yolov5s                              |[vision/classification/yolov5s](vision/classification/yolov5s)                                    |                    |                    |


## 目录结构
```
SGTPU-ModelZoo/
├── vision/                 # 模型
├── dataset/                # 数据集
├── language/               #
├── scripts                 #
└── README.md               # 项目说明文档
```

## 资料链接

* TPU-MLIR快速入门手册：https://tpumlir.org/docs/quick_start/index.html
* TPU-MLIR论文、整体工程讲解：https://www.bilibili.com/video/BV1My4y1o73Q

## 许可证

本项目采用 [2-Clause BSD License](LICENSE) 许可协议。有关详细信息，请参阅 LICENSE 文件。


