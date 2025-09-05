---
layout: default
title: 首页布局测试
permalink: /homepage-layout-test/
---

# 首页布局测试页面

这个页面用于测试首页布局修复的效果。

## 问题描述

用户反馈"SONiC与SDNoS架构深度解析：网络操作系统的未来"这篇文章显示在首页引言前面，位置不对。

## 问题原因

`jekyll-readme-index` 插件会自动在首页显示 README.md 的内容，导致：
1. README.md 内容显示在首页最前面
2. 然后是引言部分
3. 最后是博客文章部分

## 修复方案

禁用了 `jekyll-readme-index` 插件：

```yaml
# _config.yml
plugins:
  # - jekyll-readme-index  # 已禁用
```

## 修复后的首页结构

现在首页应该按以下顺序显示：

1. **引言部分**
   - 欢迎来到 i1to 的博客
   - 个人介绍和关注领域
   - 联系方式

2. **博客文章部分**
   - 技术文章
   - 网络协议文档

## 验证步骤

1. 访问 https://i1to.github.io/
2. 检查引言是否在最前面
3. 检查文章是否在引言后面
4. 确认布局顺序正确

## 技术说明

### jekyll-readme-index 插件
- **功能**: 自动在首页显示 README.md 内容
- **问题**: 会干扰自定义的首页布局
- **解决**: 禁用插件，使用自定义的 index.html

### 首页布局控制
- 使用 `index.html` 文件控制首页内容
- 通过 Liquid 模板控制文章显示
- 保持引言和文章的正确顺序

---

*测试时间: 2024年1月*
