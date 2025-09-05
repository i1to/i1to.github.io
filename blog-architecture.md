# 博客架构与部署说明

## 概述

这是一个基于 Jekyll 和 Octopress 3 构建的静态博客，托管在 GitHub Pages 上。本文档详细介绍了博客的架构设计、新文章编写流程以及 GitHub 部署机制。

## 技术栈

### 核心框架
- **Jekyll 3.10.0**: 静态网站生成器
- **GitHub Pages**: 静态网站托管服务
- **Ruby 3.0**: 运行环境
- **Markdown**: 内容编写语言

### 主要插件
- `jekyll-sitemap`: 自动生成网站地图
- `jekyll-feed`: 生成 RSS/Atom 订阅源
- `jekyll-paginate`: 分页功能
- `jekyll-seo-tag`: SEO 优化
- `jekyll-gist`: GitHub Gist 集成
- `jekyll-optional-front-matter`: 可选前置元数据
- `jekyll-readme-index`: README 索引
- `jekyll-default-layout`: 默认布局
- `jekyll-titles-from-headings`: 从标题生成页面标题
- `jekyll-relative-links`: 相对链接处理

## 博客架构

### 目录结构
```
i1to.github.io/
├── _config.yml          # Jekyll 配置文件
├── Gemfile              # Ruby 依赖管理
├── Gemfile.lock         # 依赖版本锁定
├── .github/
│   └── workflows/
│       └── jekyll.yml   # GitHub Actions 工作流
├── _layouts/            # 页面布局模板
│   ├── default.html     # 默认布局
│   ├── post.html        # 文章布局
│   ├── page.html        # 页面布局
│   └── home.html        # 首页布局
├── _includes/           # 可重用组件
│   ├── disqus.html      # Disqus 评论组件
│   ├── analytics.html   # 分析组件
│   └── meta.html        # 元数据组件
├── _posts/              # 博客文章
│   ├── 2023-07-27-hello-world.md
│   ├── 2023-11-01-gitbook-navigation.md
│   └── 2024-05-*.md
├── _sass/               # Sass 样式文件
├── assets/              # 静态资源
├── images/              # 图片资源
├── gitbook/             # GitBook 文档
├── index.html           # 首页
├── about.md             # 关于页面
├── archives.md          # 归档页面
├── categories.md        # 分类页面
└── tags.md              # 标签页面
```

### 核心组件说明

#### 1. Jekyll 配置 (`_config.yml`)
```yaml
# 基本配置
name: i1to的个人静态博客
description: 记录学习过程和个人能力展示
url: https://i1to.github.io
baseurl: ""

# 插件配置
plugins:
  - jekyll-sitemap
  - jekyll-feed
  - jekyll-paginate
  - jekyll-seo-tag
  # ... 其他插件

# Markdown 配置
kramdown:
  input: GFM
  syntax_highlighter: rouge
```

#### 2. 文章布局 (`_layouts/post.html`)
- 文章标题显示
- 发布日期格式化
- 分类和标签显示
- Disqus 评论集成

#### 3. 依赖管理 (`Gemfile`)
```ruby
source "https://rubygems.org"
gem "github-pages", "~> 232", group: :jekyll_plugins
```

## 新文章编写流程

### 1. 创建新文章
在 `_posts/` 目录下创建新的 Markdown 文件，文件名格式为：
```
YYYY-MM-DD-文章标题.md
```

### 2. 文章前置元数据 (Front Matter)
每篇文章开头必须包含 YAML 前置元数据：

```yaml
---
layout: post
title: 文章标题
date: 2024-01-01 10:00:00
categories:
  - 分类名称
tags:
  - 标签1
  - 标签2
---
```

### 3. 文章内容编写
- 使用 Markdown 语法编写内容
- 支持 GitHub Flavored Markdown (GFM)
- 支持代码高亮（使用 Rouge）
- 支持数学公式（如果配置了相关插件）

### 4. 本地预览
```bash
# 安装依赖
bundle install

# 启动本地服务器
bundle exec jekyll serve

# 访问 http://localhost:4000 预览
```

### 5. 发布文章
```bash
# 添加文件到 Git
git add _posts/新文章.md

# 提交更改
git commit -m "Add new post: 文章标题"

# 推送到 GitHub
git push origin master
```

## GitHub 部署机制

### 1. GitHub Pages 自动构建
- 当代码推送到 `master` 分支时，GitHub Pages 自动触发构建
- 使用 GitHub Pages 预配置的 Jekyll 环境
- 构建过程包括：
  - 安装依赖 (`bundle install`)
  - 生成静态网站 (`jekyll build`)
  - 部署到 `gh-pages` 分支

### 2. GitHub Actions 工作流
我们配置了自定义的 GitHub Actions 工作流 (`.github/workflows/jekyll.yml`)：

```yaml
name: Jekyll site CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

# 设置权限
permissions:
  contents: read
  pages: write
  id-token: write

# 允许并发部署
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v4
    
    - uses: ruby/setup-ruby@v1
      with:
        ruby-version: '3.0'
        bundler-cache: true
    
    - name: Install dependencies
      run: |
        gem install bundler
        bundle install --jobs 4 --retry 3
    
    - name: Build site
      run: |
        bundle exec jekyll build --safe --verbose
    
    - name: Setup Pages
      uses: actions/configure-pages@v4
    
    - name: Upload artifact
      uses: actions/upload-pages-artifact@v3
      with:
        path: ./_site

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### 3. 部署流程
1. **代码推送**: 开发者推送代码到 `master` 分支
2. **触发构建**: GitHub Actions 检测到推送事件
3. **环境准备**: 设置 Ruby 3.1 环境
4. **依赖安装**: 安装 Jekyll 和相关插件
5. **网站构建**: 执行 `jekyll build` 生成静态文件
6. **自动部署**: 将生成的 `_site` 目录内容推送到 `gh-pages` 分支
7. **网站更新**: GitHub Pages 从 `gh-pages` 分支更新网站内容

## 博客实现原理

### 1. 静态网站生成
Jekyll 将 Markdown 文件、HTML 模板和配置文件转换为静态 HTML 网站：

```
Markdown 文章 + 布局模板 + 配置 → Jekyll 处理 → 静态 HTML 文件
```

### 2. 模板系统
- **Liquid 模板引擎**: Jekyll 使用 Liquid 处理模板
- **布局继承**: 页面可以继承基础布局
- **变量系统**: 支持全局变量和页面变量

### 3. 内容管理
- **集合 (Collections)**: 组织不同类型的内容
- **分类和标签**: 自动生成分类和标签页面
- **分页**: 支持文章列表分页

### 4. 资源处理
- **Sass 编译**: 自动编译 Sass 文件为 CSS
- **图片优化**: 支持图片压缩和优化
- **资源管道**: 自动处理 CSS、JS 等资源

## 优势与特点

### 1. 性能优势
- **静态文件**: 无需数据库，加载速度快
- **CDN 友好**: 可以轻松集成 CDN 加速
- **SEO 优化**: 静态 HTML 对搜索引擎友好

### 2. 开发体验
- **版本控制**: 所有内容都在 Git 中管理
- **Markdown 编写**: 简单易用的内容编写方式
- **本地预览**: 支持本地开发和预览

### 3. 维护成本
- **零维护**: 无需维护服务器和数据库
- **自动备份**: Git 提供完整的版本历史
- **免费托管**: GitHub Pages 提供免费托管

## 故障排除

### 常见问题
1. **构建失败**: 检查 `_config.yml` 配置和插件兼容性
2. **样式问题**: 确认 Sass 文件路径和语法正确
3. **链接错误**: 检查相对路径和 `baseurl` 配置

### 调试方法
1. **本地构建**: 使用 `bundle exec jekyll build --verbose` 查看详细错误
2. **GitHub Actions 日志**: 查看 Actions 页面的构建日志
3. **Jekyll 文档**: 参考 [Jekyll 官方文档](https://jekyllrb.com/docs/)

## 总结

这个博客系统通过 Jekyll 和 GitHub Pages 的组合，实现了：
- 简单的内容管理流程
- 自动化的部署机制
- 高性能的静态网站
- 零成本的维护方案

通过 Git 工作流和 Markdown 编写，开发者可以专注于内容创作，而技术细节由 Jekyll 和 GitHub Pages 自动处理。
