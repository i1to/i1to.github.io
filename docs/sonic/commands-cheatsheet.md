---
layout: docs
title: 命令速查表
parent: SONiC 架构详解
permalink: /docs/sonic/commands-cheatsheet/
nav_order: 1.3
---

# SONiC 命令速查表

## 系统管理命令

### 系统信息
```bash
# 查看系统版本
show version

# 查看系统状态
show system status

# 查看系统时间
show system time

# 查看系统内存
show system memory

# 查看系统 CPU
show system cpu
```

### 用户管理
```bash
# 查看用户
show user

# 添加用户
sudo config user add username password

# 删除用户
sudo config user del username

# 修改密码
sudo passwd username
```

## 网络接口命令

### 接口状态
```bash
# 查看所有接口状态
show interface status

# 查看接口简要信息
show interface brief

# 查看特定接口状态
show interface status Ethernet0

# 查看接口统计信息
show interface counters
```

### 接口配置
```bash
# 配置接口 IP
sudo config interface ip add Ethernet0 192.168.1.1/24

# 删除接口 IP
sudo config interface ip del Ethernet0 192.168.1.1/24

# 启动接口
sudo config interface startup Ethernet0

# 关闭接口
sudo config interface shutdown Ethernet0

# 设置接口速度
sudo config interface speed Ethernet0 1000
```

## VLAN 命令

### VLAN 管理
```bash
# 查看 VLAN 列表
show vlan brief

# 创建 VLAN
sudo config vlan add 100

# 删除 VLAN
sudo config vlan del 100

# 查看 VLAN 成员
show vlan member

# 添加 VLAN 成员
sudo config vlan member add -u 100 Ethernet0

# 删除 VLAN 成员
sudo config vlan member del 100 Ethernet0
```

### VLAN 接口
```bash
# 配置 VLAN 接口 IP
sudo config interface ip add Vlan100 192.168.100.1/24

# 删除 VLAN 接口 IP
sudo config interface ip del Vlan100 192.168.100.1/24

# 启动 VLAN 接口
sudo config interface startup Vlan100
```

## 路由命令

### 路由表
```bash
# 查看路由表
show ip route

# 查看 IPv6 路由表
show ipv6 route

# 查看路由统计
show ip route summary
```

### 路由配置
```bash
# 添加静态路由
sudo config route add 192.168.2.0/24 192.168.1.1

# 删除静态路由
sudo config route del 192.168.2.0/24 192.168.1.1

# 添加默认路由
sudo config route add 0.0.0.0/0 192.168.1.1
```

## ACL 命令

### ACL 表管理
```bash
# 查看 ACL 表
show acl table

# 创建 ACL 表
sudo config acl add table test_acl L3

# 删除 ACL 表
sudo config acl del table test_acl
```

### ACL 规则管理
```bash
# 查看 ACL 规则
show acl rule test_acl

# 添加 ACL 规则
sudo config acl add rule test_acl RULE_1 IP_PROTOCOL 1 ACTION FORWARD

# 删除 ACL 规则
sudo config acl del rule test_acl RULE_1
```

### ACL 绑定
```bash
# 绑定 ACL 到接口
sudo config acl add table test_acl Ethernet0

# 解绑 ACL
sudo config acl del table test_acl Ethernet0
```

## BGP 命令

### BGP 状态
```bash
# 查看 BGP 邻居
show bgp neighbors

# 查看 BGP 路由
show bgp routes

# 查看 BGP 摘要
show bgp summary
```

### BGP 配置
```bash
# 配置 BGP 邻居
sudo config bgp add neighbor 192.168.1.2 65001

# 删除 BGP 邻居
sudo config bgp del neighbor 192.168.1.2 65001

# 配置 BGP 网络
sudo config bgp add network 192.168.1.0/24
```

## Redis 命令

### Redis 连接
```bash
# 连接 Redis
redis-cli

# 查看 Redis 信息
redis-cli info

# 查看所有键
redis-cli keys "*"
```

### 数据库操作
```bash
# 查看数据库大小
redis-cli dbsize

# 清空数据库
redis-cli flushdb

# 查看键值
redis-cli get "key_name"
```

## 配置管理命令

### 配置保存和加载
```bash
# 保存配置
sudo config save

# 加载配置
sudo config load

# 查看运行配置
show runningconfiguration

# 查看启动配置
show startupconfiguration
```

### 配置重置
```bash
# 重置为默认配置
sudo config reset

# 重启服务
sudo systemctl restart sonic.target
```

## 监控和调试命令

### 日志查看
```bash
# 查看系统日志
sudo journalctl -u sonic.target

# 查看特定服务日志
sudo journalctl -u swss

# 实时查看日志
sudo journalctl -u sonic.target -f
```

### 性能监控
```bash
# 查看端口统计
show interface counters

# 查看 CPU 使用率
show system cpu

# 查看内存使用
show system memory
```

### 网络调试
```bash
# ping 测试
ping 192.168.1.1

# traceroute 测试
traceroute 192.168.1.1

# 查看 ARP 表
show arp

# 查看 MAC 地址表
show mac
```

## 常用组合命令

### 快速状态检查
```bash
# 一键查看系统状态
show version && show interface status && show ip route
```

### 网络连通性测试
```bash
# 测试到网关的连通性
ping -c 3 $(ip route | grep default | awk '{print $3}')
```

### 配置备份
```bash
# 备份当前配置
sudo config save && cp /etc/sonic/config_db.json /tmp/config_backup.json
```

## 快捷键

### 命令行快捷键
- `Ctrl + C`: 中断当前命令
- `Ctrl + D`: 退出当前会话
- `Ctrl + L`: 清屏
- `Tab`: 自动补全
- `↑/↓`: 命令历史

### 编辑快捷键
- `Ctrl + A`: 移动到行首
- `Ctrl + E`: 移动到行尾
- `Ctrl + K`: 删除到行尾
- `Ctrl + U`: 删除到行首

## 故障排除常用命令

### 网络问题诊断
```bash
# 1. 检查接口状态
show interface status

# 2. 检查 IP 配置
ip addr show

# 3. 检查路由表
show ip route

# 4. 测试连通性
ping -c 3 8.8.8.8

# 5. 检查 ARP 表
show arp
```

### 服务问题诊断
```bash
# 1. 检查服务状态
sudo systemctl status sonic.target

# 2. 查看服务日志
sudo journalctl -u sonic.target -n 50

# 3. 重启服务
sudo systemctl restart sonic.target

# 4. 检查 Redis 状态
redis-cli ping
```

---

*最后更新：2024年1月*
