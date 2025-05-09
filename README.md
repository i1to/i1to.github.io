
<h1 align="center">i1to的个人静态博客</h1>

<p align="center">
  <a href="https://jekyllrb.com/"><img src="https://img.shields.io/badge/框架-Jekyll-red" alt="Jekyll"></a>
  <a href="https://pages.github.com"><img src="https://img.shields.io/badge/部署-GitHub_Pages-black" alt="GitHub Pages"></a>
  <a href="https://github.com/i1to/i1to.github.io"><img src="https://img.shields.io/badge/源码-GitHub-blue" alt="GitHub"></a>
  <a href="https://travis-ci.org/i1to/i1to.github.io"><img src="https://img.shields.io/travis/i1to/i1to.github.io/master.svg" alt="Build Status"></a>
</p>

## 📝 博客简介

这个是 [i1to](https://github.com/i1to) 的个人博客，主要用于记录学习过程和个人能力展示。通过分享技术文章、学习笔记和个人项目，希望能为读者提供有价值的内容和帮助。

## 🚀 特色内容

- 技术文章与教程
- 学习笔记与心得
- 项目展示与分析
- 个人成长与经验分享

## 🔍 如何访问

访问 [https://i1to.github.io/](https://i1to.github.io/) 即可浏览所有博客内容。

## 🛠️ 技术栈

- **框架**: [Jekyll](https://jekyllrb.com/) - 简单、可扩展的静态网站生成器
- **部署**: [GitHub Pages](https://pages.github.com) - 直接从 GitHub 仓库托管静态网站
- **自动化**: [Travis CI](https://travis-ci.org/) - 自动构建和部署
- **测试**: [html-proofer](https://github.com/gjtorikian/html-proofer) - 验证生成的 HTML 文件
- **编写**: 所有文章使用 [Markdown](https://daringfireball.net/projects/markdown/) 格式编写

## 📂 目录结构

```
.
├── _posts/             # 博客文章目录
├── _layouts/           # 布局模板
├── _includes/          # 可重用的HTML组件
├── _sass/              # Sass 样式文件
├── assets/             # 静态资源（CSS、JS、图片等）
├── script/             # 构建脚本
├── .travis.yml         # Travis CI 配置文件
├── _config.yml         # Jekyll配置文件
├── index.md            # 首页
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

## � 自动部署流程

本博客使用 Travis CI 实现自动部署：

1. 将更改推送到 GitHub 仓库的 master 分支
2. Travis CI 自动检测到更改并开始构建过程
3. Travis CI 运行 `script/cibuild` 脚本，构建网站并进行 HTML 验证
4. 如果构建成功，Travis CI 将生成的网站部署到 GitHub Pages

这样，您只需要专注于内容创作，而不需要手动构建和部署网站。

## �📝 创建新文章

在 `_posts` 目录下创建一个新的 Markdown 文件，文件名格式为 `YYYY-MM-DD-title.md`，例如 `2023-05-01-hello-world.md`。

文件开头需要包含 YAML 头信息：

```yaml
---
layout: post
title: "文章标题"
date: YYYY-MM-DD HH:MM:SS
categories:
  - 分类1
  - 分类2
tags:
  - 标签1
  - 标签2
---

这里是文章内容...
```

## 📞 联系方式

如有任何问题、建议或合作意向，欢迎通过以下方式联系我：

- GitHub: [i1to](https://github.com/i1to)
- 博客留言: 在博客文章下方评论区留言

## 📄 许可证

本博客内容采用 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可协议。
