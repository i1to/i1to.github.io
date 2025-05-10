---
layout: page
title: 网络协议文档
permalink: /gitbook/
---

# 网络协议文档

这里收集了我整理的网络协议文档，主要包括 NETCONF、YANG 等网络协议的 RFC 文档。

## 文档列表

{% for item in site.data.gitbook_toc %}
- [{{ item.title }}]({{ site.baseurl }}/gitbook/{{ item.path }})
{% endfor %}

## 关于这些文档

这些文档是我在学习和工作过程中整理的，主要包括：

- 原始 RFC 文本的英中翻译
- 关键概念的解释和注释
- 实际应用示例和最佳实践
- 常见问题和解决方案

## 如何使用

您可以直接点击上面的链接查看文档，也可以克隆 GitHub 仓库在本地查看：

```bash
git clone https://github.com/i1to/gitbooks.git
cd gitbooks
# 安装 GitBook CLI（如果尚未安装）
npm install -g gitbook-cli
# 启动 GitBook 服务器
gitbook serve
```
