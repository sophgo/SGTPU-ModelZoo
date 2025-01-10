# SGTPU-ModelZoo

SGTPU-ModelZoo 是一个开源项目 xxxx

## 简介
该项目旨在帮助开发者 xxx


## 安装指南
### 1. 安装 tpu-mlir
首先检查当前系统环境是否满足 ubuntu 22.04 和 python 3.10。如不满足，请进行下一节 [基础环境配置](#10-基础环境配置) ；如满足，直接跳至 [tpu_mlir 安装](#tpu_mlir-安装) 。
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

#### 1.1 tpu_mlir 安装

目前支持2种安装方法，分别是 [__在线安装__](#在线安装) 和 [__离线安装__](#离线安装)。

##### 在线安装

直接从pypi下载并安装，默认安装最新版：
```bash
$ pip install tpu_mlir
```

##### 离线安装

从Github的 [Assets](https://github.com/sophgo/tpu-mlir/releases/) 处下载最新的 tpu_mlir-*-py3-none-any.whl，然后使用pip安装:
```bash
$ pip install tpu_mlir-*-py3-none-any.whl
```

```NOTICE:``` tpu_mlir在对不同框架模型处理时所需的依赖不同，在线安装和离线安装方式都需要安装额外依赖。

在线安装
```bash
# 安装onnx依赖
$ pip install tpu_mlir[onnx]
```

离线安装

```bash
# 安装onnx依赖
$ pip install tpu_mlir-*-py3-none-any.whl[onnx]
```


## 2. 使用方法

打开具体模型所在的目录，比如 ```yolov5s```模型在 ```SGTPU-ModelZoo/vision/classification/yolov5s/```，利用转换文件转换 ```yolov5s.onnx``` 文件
```bash
bash convert.sh
```


### 模型导航
|Model                            |Path                                                                                                  |NNTC                |MLIR                |
|:-                               |:-                                                                                                    |:-                  |:-                  |
|mobilenetv2                          |[vision/classification/mobilenetv2](vision/classification/mobilenetv2)                            |                    |                    |
|resnet50_v2                          |[vision/classification/resnet50_v2](vision/classification/resnet50_v2)                            |                    |                    |
|squeezenet_v1.1_cf_cvs20             |[vision/classification/squeezenet_v1.1_cf_cvs20](vision/classification/squeezenet_v1.1_cf_cvs20)  |                    |                    |
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

## 常见问题
...

## 贡献指南
...

## 许可证


