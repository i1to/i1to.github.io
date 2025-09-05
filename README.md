
<h1 align="center">i1to的个人静态博客</h1>

<p align="center">
  <a href="https://jekyllrb.com/"><img src="https://img.shields.io/badge/框架-Jekyll-red" alt="Jekyll"></a>
  <a href="https://pages.github.com"><img src="https://img.shields.io/badge/部署-GitHub_Pages-black" alt="GitHub Pages"></a>
  <a href="https://github.com/i1to/i1to.github.io"><img src="https://img.shields.io/badge/源码-GitHub-blue" alt="GitHub"></a>
  <a href="https://github.com/i1to/i1to.github.io/actions"><img src="https://github.com/i1to/i1to.github.io/actions/workflows/jekyll-gh-pages.yml/badge.svg" alt="Build Status"></a>
</p>

<p align="center">
  <i>"当你生活中遇到问题，觉得如果以前要有人在这个地方做点什么就好了，这个人就是你。"</i>
</p>

## 📝 博客简介

这个是 [i1to](https://github.com/i1to) 的个人静态博客，主要用于记录学习过程和个人能力展示。作为一名Linux网络开发者，我专注于网络基础设施和协议相关的技术探索。通过分享技术文章、学习笔记和个人项目，希望能为读者提供有价值的内容和帮助。

## 🚀 特色内容

- **技术文章与教程**：详细解析网络协议和Linux网络开发相关知识
- **学习笔记与心得**：记录技术学习过程中的发现和思考
- **项目展示与分析**：分享个人项目的开发过程和技术选型
- **GitBook文档库**：提供NETCONF、YANG等网络协议的RFC文档中英对照版
- **📖 [博客架构说明](blog-architecture.md)**：详细介绍Jekyll博客的技术架构、新文章编写流程和GitHub部署机制

## 🔍 如何访问

访问 [https://i1to.github.io/](https://i1to.github.io/) 即可浏览所有博客内容。

## 🛠️ 技术栈

- **框架**: [Jekyll](https://jekyllrb.com/) - 简单、可扩展的静态网站生成器
- **部署**: [GitHub Pages](https://pages.github.com) - 直接从 GitHub 仓库托管静态网站
- **自动化**: [GitHub Actions](https://github.com/features/actions) - 自动构建和部署
- **测试**: [html-proofer](https://github.com/gjtorikian/html-proofer) - 验证生成的 HTML 文件（本地测试）
- **编写**: 所有文章使用 [Markdown](https://daringfireball.net/projects/markdown/) 格式编写
- **文档库**: 集成 [GitBook](https://www.gitbook.com/) 风格的文档系统，提供网络协议RFC文档
- **样式**: [Sass](https://sass-lang.com/) - CSS 预处理器
- **语法高亮**: [Rouge](https://github.com/rouge-ruby/rouge) - 代码语法高亮

> 💡 **想了解更多技术细节？** 查看 [📖 博客架构说明](blog-architecture.md) 了解完整的技术架构、新文章编写流程和GitHub部署机制。

## 📂 目录结构

```
.
├── _posts/             # 博客文章目录
├── _layouts/           # 布局模板
├── _includes/          # 可重用的HTML组件
├── _sass/              # Sass 样式文件
├── assets/             # 静态资源（CSS、JS、图片等）
├── gitbook/            # GitBook文档目录
├── gitbooks/           # GitBook源文件目录
├── script/             # 构建脚本
├── .github/            # GitHub Actions工作流配置
├── _config.yml         # Jekyll配置文件
├── index.html          # 首页
├── about.md            # 关于页面
├── archives.md         # 归档页面
├── categories.md       # 分类页面
└── tags.md             # 标签页面
```

## 🚀 本地运行

1. 确保已安装 [Ruby](https://www.ruby-lang.org/) 和 [Bundler](https://bundler.io/)
2. 克隆仓库：`git clone https://github.com/i1to/i1to.github.io.git`
3. 进入目录：`cd i1to.github.io`
4. 安装依赖：`bundle install`
5. 启动本地服务器：`bundle exec jekyll serve`
6. 在浏览器中访问：`http://localhost:4000`

## 🔄 自动部署流程

本博客使用 GitHub Actions 实现自动部署：

1. 将更改推送到 GitHub 仓库的 main 或 master 分支
2. GitHub Actions 自动检测到更改并开始构建过程
3. 工作流运行 Jekyll 构建命令，生成静态网站文件
4. 如果构建成功，GitHub Actions 将生成的网站部署到 GitHub Pages

这样，只需要专注于内容创作，而不需要手动构建和部署网站。

## 📝 创建新文章

在 `_posts` 目录下创建一个新的 Markdown 文件，文件名格式为 `YYYY-MM-DD-title.md`，例如 `2024-05-10-why-i-started-blogging.md`。

文件开头需要包含 YAML 头信息：

```yaml
---
layout: post
title: "博客的起点"
date: 2024-05-10 10:00:00
categories:
  - Diary
tags:
  - 博客
  - Jekyll
  - GitHub Pages
  - 个人成长
---

> "当你生活中遇到问题，觉得如果以前要有人在这个地方做点什么就好了，这个人就是你。"
>
> — Hacker News 读者

这里是文章内容...
```

## 📚 GitBook 文档库

本博客集成了 GitBook 风格的文档库，提供网络协议相关的 RFC 文档，包括：

- **NETCONF 协议**：NETCONF 配置协议、NETCONF over SSH、NETCONF 事件通知等
- **YANG 数据建模**：YANG 数据建模语言、YANG 1.1 数据建模语言、YANG 接口类型定义等
- **YumaPro 相关文档**：YumaPro 工具套件的使用文档

访问 [GitBook 文档库](https://i1to.github.io/gitbook-docs/) 浏览所有文档。

## 📞 联系方式

如有任何问题、建议或合作意向，欢迎通过以下方式联系我：

- **GitHub**: [i1to](https://github.com/i1to)
- **博客**: [i1to.github.io](https://i1to.github.io/)
- **知乎**: [volleritoo](https://www.zhihu.com/people/volleritoo)
- **Bilibili**: [i1to](https://space.bilibili.com/306494243)

## 📄 许可证

本博客内容采用 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可协议。
