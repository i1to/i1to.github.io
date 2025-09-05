---
layout: default
title: 头部样式测试
permalink: /header-test/
---

# 头部样式测试页面

这个页面用于测试头部头像和描述的显示效果。

## 修改内容

1. **头像尺寸**: 从 70px × 70px 缩小到 50px × 50px
2. **站点描述**: 隐藏"记录学习过程和个人能力展示"文字

## 测试项目

- [x] 头像尺寸是否合适
- [x] 站点描述是否已隐藏
- [x] 布局是否保持美观
- [x] 响应式设计是否正常

## 样式说明

### 头像样式
```css
.site-avatar {
  width: 50px;
  height: 50px;
  margin-right: 15px;
}

.site-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 5px;
}
```

### 描述隐藏
```css
.site-description {
  display: none;
}
```

## 效果预览

现在头部应该显示：
- 较小的头像 (50px)
- 站点名称
- 导航菜单
- 不显示站点描述

---

*测试完成时间: 2024年1月*
