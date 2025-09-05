---
layout: docs
title: SONiC 相关博客
permalink: /docs/sonic-blogs/
---

# SONiC 相关博客

这里收集了网络上优秀的SONiC相关技术博客和资源，为学习SONiC网络操作系统的开发者提供丰富的参考资料。

## 精选博客

### 1. Rancho Blog
**作者**: Rancho  
**网站**: https://rancho333.github.io/  
**特色**: 专注于SONiC系统启动和平台相关技术

#### 推荐文章
- [SONiC启动简述](https://rancho333.github.io/2021/01/29/SONiC%E5%90%AF%E5%8A%A8%E7%AE%80%E8%BF%B0/)
  - 详细介绍SONiC初始化过程中platform识别机制
  - 解析`/host/machine.conf`和`/etc/sonic/config_db.json`配置
  - 分析chassis相关组件的初始化流程

- [SONiC标签文章](https://rancho333.github.io/tags/SONiC/)
  - 包含多篇SONiC技术文章
  - 涵盖系统管理、配置优化等主题

### 2. r12f 技术博客
**作者**: r12f  
**网站**: https://r12f.com/  
**特色**: 系统性的SONiC学习笔记系列

#### 学习笔记系列
- [SONiC学习笔记（一）：概述与安装](https://r12f.com/2021/04/27/sonic-overview-installation/)
- [SONiC学习笔记（二）：核心组件](https://r12f.com/2021/04/29/sonic-core-components/)
- [SONiC学习笔记（三）：代码仓库](https://r12f.com/2021/05/01/sonic-code-repositories/)
- [SONiC学习笔记（四）：通信机制](https://r12f.com/2021/05/09/sonic-communication/)
- [SONiC学习笔记（五）：Syncd-SAI工作流](https://r12f.com/2021/06/25/sonic-syncd-sai-workflow/)
- [SONiC学习笔记（六）：BGP工作流（上）—— 命令实现与FRR](https://r12f.com/2021/07/02/sonic-bgp-workflow-part1/)
- [SONiC学习笔记（七）：BGP工作流（下）—— BGP路由变更下发](https://r12f.com/2021/07/04/sonic-bgp-workflow-part2/)

#### 完整学习资源
- [SONiC Book](https://r12f.com/sonic-book/) - 完整的SONiC学习指南
- [SONiC标签文章](https://r12f.com/tags/sonic/) - 所有SONiC相关文章

### 3. HackMD 技术笔记
**作者**: octobersky  
**平台**: HackMD  
**链接**: https://hackmd.io/@octobersky/B1tohBQ7u#tags-SONiC  
**特色**: 协作式技术文档，包含SONiC相关技术笔记

### 4. Tim's Blog
**作者**: Tim  
**网站**: https://timmy00274672.wordpress.com/  
**特色**: 系统底层技术分析，包含SONiC相关技术内容

#### 技术主题
- 系统启动和硬件相关技术
- 网络协议和驱动开发
- 底层系统编程

### 5. EisenHao 技术博客
**作者**: EisenHao  
**网站**: https://eisenhao.cn:8443/  
**特色**: 网络技术和系统管理相关文章

### 6. ZhaoCS 技术博客
**作者**: ZhaoCS  
**网站**: https://www.zhaocs.info/  
**特色**: 包含SONiC相关技术文章

#### SONiC相关文章
- [SONiC标签文章](https://www.zhaocs.info/tag/sonic) - 多篇SONiC技术文章

## 学习路径建议

### 初学者路径
1. **基础概念**: 从r12f的SONiC学习笔记系列开始
2. **系统启动**: 阅读Rancho的SONiC启动简述
3. **实践操作**: 参考官方文档进行实际部署

### 进阶学习
1. **深度技术**: 研究r12f的BGP工作流分析
2. **底层原理**: 学习Tim's Blog的系统底层技术
3. **协作学习**: 参与HackMD的技术讨论

### 专业开发
1. **源码分析**: 深入研究SONiC代码仓库
2. **平台适配**: 学习platform相关技术
3. **社区贡献**: 参与SONiC开源社区

## 技术主题分类

### 系统架构
- SONiC整体架构设计
- 微服务容器化架构
- Redis数据库应用

### 核心组件
- Syncd和SAI接口
- BGP路由协议
- 服务间通信机制

### 开发调试
- 代码仓库结构
- 构建和测试流程
- 调试技巧和工具

### 平台相关
- 硬件抽象层(SAI)
- 平台适配开发
- 设备驱动开发

## 社区资源

### 官方资源
- [SONiC官方Wiki](https://github.com/Azure/SONiC/wiki)
- [SONiC GitHub仓库](https://github.com/Azure/SONiC)
- [SONiC官方文档](https://sonic-net.github.io/SONiC/)

### 社区活动
- OCP Global Summit SONiC Workshop
- SONiC社区会议和讨论
- 技术分享和最佳实践

## 贡献指南

如果您有优秀的SONiC相关博客文章或资源，欢迎：

1. **提交建议**: 通过GitHub Issues推荐新的博客资源
2. **内容更新**: 提交Pull Request更新现有链接
3. **质量维护**: 帮助维护链接的有效性和内容质量

## 更新日志

- **2024-01-15**: 初始创建，收集8个优质SONiC技术博客
- **2024-01-15**: 添加学习路径建议和技术主题分类

---

*最后更新：2024年1月*  
*维护者：i1to.github.io*
