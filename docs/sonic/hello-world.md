---
layout: docs
title: Hello World! 虚拟环境
parent: SONiC 架构详解
permalink: /docs/sonic/hello-world/
nav_order: 1.2
---

# Hello World! 虚拟环境

本教程将引导您创建一个简单的 SONiC 虚拟环境，体验基本的网络配置和操作。

## 环境准备

### 使用 SONiC 虚拟机

1. **启动 SONiC 虚拟机**
   ```bash
   qemu-system-x86_64 -hda sonic-vm.qcow2 -cdrom sonic-vs.img -boot d -m 4096
   ```

2. **登录系统**
   - 用户名: `admin`
   - 密码: `YourPaSsWoRd`

### 使用 Docker 容器

1. **运行 SONiC 容器**
   ```bash
   docker run -it --privileged --net=host sonicdev/sonic:latest
   ```

## 基本操作

### 1. 查看系统状态

```bash
# 查看系统信息
show version

# 查看接口状态
show interface status

# 查看路由表
show ip route
```

### 2. 配置管理接口

```bash
# 配置管理接口 IP
sudo config interface ip add eth0 192.168.1.100/24

# 配置默认路由
sudo config route add 0.0.0.0/0 192.168.1.1

# 保存配置
sudo config save
```

### 3. 创建 VLAN

```bash
# 创建 VLAN 100
sudo config vlan add 100

# 将接口添加到 VLAN
sudo config vlan member add -u 100 Ethernet0

# 配置 VLAN IP
sudo config interface ip add Vlan100 192.168.100.1/24
```

### 4. 配置 ACL

```bash
# 创建 ACL 规则
sudo config acl add table test_acl L3

# 添加 ACL 规则
sudo config acl add rule test_acl RULE_1 IP_PROTOCOL 1 ACTION FORWARD

# 绑定 ACL 到接口
sudo config acl add table test_acl Ethernet0
```

## 网络拓扑示例

### 简单的二层网络

```
[Host A] ---- [SONiC Switch] ---- [Host B]
    |              |                  |
192.168.1.10  192.168.1.1      192.168.1.20
```

**配置步骤**:

1. **配置管理接口**
   ```bash
   sudo config interface ip add eth0 192.168.1.1/24
   ```

2. **配置数据接口**
   ```bash
   sudo config interface ip add Ethernet0 192.168.1.1/24
   sudo config interface ip add Ethernet4 192.168.1.1/24
   ```

3. **启用接口**
   ```bash
   sudo config interface startup Ethernet0
   sudo config interface startup Ethernet4
   ```

### 三层网络示例

```
[Host A] ---- [VLAN 10] ---- [SONiC Switch] ---- [VLAN 20] ---- [Host B]
    |                           |                                    |
192.168.10.10              192.168.10.1                        192.168.20.20
                                192.168.20.1
```

**配置步骤**:

1. **创建 VLAN**
   ```bash
   sudo config vlan add 10
   sudo config vlan add 20
   ```

2. **配置 VLAN 接口**
   ```bash
   sudo config interface ip add Vlan10 192.168.10.1/24
   sudo config interface ip add Vlan20 192.168.20.1/24
   ```

3. **添加 VLAN 成员**
   ```bash
   sudo config vlan member add -u 10 Ethernet0
   sudo config vlan member add -u 20 Ethernet4
   ```

## 验证配置

### 测试连通性

```bash
# 从 SONiC 测试到主机
ping 192.168.1.10
ping 192.168.1.20

# 查看 ARP 表
show arp

# 查看 MAC 地址表
show mac
```

### 查看配置

```bash
# 查看当前配置
show runningconfiguration

# 查看接口配置
show interface brief

# 查看 VLAN 配置
show vlan brief
```

## 故障排除

### 常见问题

1. **接口无法启动**
   ```bash
   # 检查接口状态
   show interface status
   
   # 手动启动接口
   sudo config interface startup Ethernet0
   ```

2. **无法 ping 通**
   ```bash
   # 检查路由表
   show ip route
   
   # 检查 ARP 表
   show arp
   
   # 检查接口状态
   show interface status
   ```

3. **VLAN 配置问题**
   ```bash
   # 检查 VLAN 配置
   show vlan brief
   
   # 检查 VLAN 成员
   show vlan member
   ```

## 下一步

完成 Hello World 教程后，您可以：

1. 学习 [命令速查表](/docs/sonic/commands-cheatsheet/)
2. 了解 [核心组件](/docs/sonic/core-components/)
3. 深入 [服务通信机制](/docs/sonic/service-communication/)

## 实验练习

### 练习 1: 基本网络配置
- 配置两个 VLAN
- 实现 VLAN 间路由
- 测试连通性

### 练习 2: ACL 配置
- 创建 ACL 规则
- 限制特定流量
- 验证 ACL 效果

### 练习 3: 监控和调试
- 使用 show 命令查看状态
- 分析日志信息
- 进行故障排除

---

*最后更新：2024年1月*
