---
layout: docs
title: 安装指南
parent: SONiC 架构详解
permalink: /docs/sonic/installation/
nav_order: 1.1
---

# SONiC 安装指南

## 系统要求

### 硬件要求
- **CPU**: x86_64 架构
- **内存**: 最少 4GB RAM，推荐 8GB 或更多
- **存储**: 最少 16GB 可用空间
- **网络**: 至少一个网络接口

### 支持的平台
- Ubuntu 18.04 LTS
- Ubuntu 20.04 LTS
- Debian 10/11
- CentOS 7/8

## 安装方法

### 方法一：使用预编译镜像

1. **下载 SONiC 镜像**
   ```bash
   wget https://github.com/Azure/SONiC/releases/download/v202205.1/sonic-vs.img.gz
   gunzip sonic-vs.img.gz
   ```

2. **创建虚拟机**
   ```bash
   qemu-img create -f qcow2 sonic-vm.qcow2 20G
   qemu-system-x86_64 -hda sonic-vm.qcow2 -cdrom sonic-vs.img -boot d -m 4096
   ```

### 方法二：从源码编译

1. **安装依赖**
   ```bash
   sudo apt-get update
   sudo apt-get install -y build-essential git python3-dev python3-pip
   ```

2. **克隆仓库**
   ```bash
   git clone https://github.com/Azure/SONiC.git
   cd SONiC
   ```

3. **编译 SONiC**
   ```bash
   make configure
   make target/sonic-vs.img
   ```

### 方法三：使用 Docker

1. **拉取 SONiC 镜像**
   ```bash
   docker pull sonicdev/sonic:latest
   ```

2. **运行容器**
   ```bash
   docker run -it --privileged --net=host sonicdev/sonic:latest
   ```

## 配置网络

### 基本网络配置

1. **查看网络接口**
   ```bash
   ip link show
   ```

2. **配置管理接口**
   ```bash
   sudo config interface ip add eth0 192.168.1.100/24
   ```

3. **配置路由**
   ```bash
   sudo config route add 0.0.0.0/0 192.168.1.1
   ```

### VLAN 配置

1. **创建 VLAN**
   ```bash
   sudo config vlan add 100
   sudo config vlan member add -u 100 Ethernet0
   ```

2. **配置 VLAN IP**
   ```bash
   sudo config interface ip add Vlan100 192.168.100.1/24
   ```

## 验证安装

### 检查服务状态
```bash
sudo systemctl status sonic.target
```

### 检查 Redis 状态
```bash
redis-cli ping
```

### 检查网络配置
```bash
show interface status
show ip route
```

## 常见问题

### Q: 启动时出现网络错误
**A**: 检查网络接口配置，确保管理接口正确配置。

### Q: Redis 服务无法启动
**A**: 检查 Redis 配置文件，确保端口没有被占用。

### Q: 无法访问 Web 界面
**A**: 检查防火墙设置，确保端口 8080 开放。

## 下一步

安装完成后，您可以：

1. 学习 [Hello World 教程](/docs/sonic/hello-world/)
2. 查看 [命令速查表](/docs/sonic/commands-cheatsheet/)
3. 了解 [核心组件](/docs/sonic/core-components/)

---

*最后更新：2024年1月*
