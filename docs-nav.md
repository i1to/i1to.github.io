---
layout: page
title: 技术文档
permalink: /docs-nav/
---

<div class="docs-nav-page">
  <div class="docs-hero">
    <h1>技术文档中心</h1>
    <p>深入的技术文档，涵盖网络技术、开发工具和系统运维等各个领域</p>
  </div>

  <div class="docs-categories">
    <div class="category-card">
      <div class="category-icon">🌐</div>
      <h2>网络技术</h2>
      <p>SONiC、SDNoS、网络协议等网络相关技术文档</p>
      <ul>
        <li><a href="{{ site.baseurl }}/docs/sonic/">SONiC 架构详解</a></li>
        <li><a href="{{ site.baseurl }}/docs/sdnos/">SDNoS 系统分析</a></li>
        <li><a href="{{ site.baseurl }}/docs/rfc/">网络协议 RFC 文档</a></li>
      </ul>
    </div>

    <div class="category-card">
      <div class="category-icon">🛠️</div>
      <h2>开发工具</h2>
      <p>Jekyll、GitHub Actions、Docker 等开发工具使用指南</p>
      <ul>
        <li><a href="{{ site.baseurl }}/docs/jekyll/">Jekyll 博客搭建</a></li>
        <li><a href="{{ site.baseurl }}/docs/github-actions/">GitHub Actions 配置</a></li>
        <li><a href="{{ site.baseurl }}/docs/docker/">Docker 容器化</a></li>
      </ul>
    </div>

    <div class="category-card">
      <div class="category-icon">⚙️</div>
      <h2>系统运维</h2>
      <p>Linux 系统管理、网络配置、监控日志等运维相关文档</p>
      <ul>
        <li><a href="{{ site.baseurl }}/docs/linux/">Linux 系统管理</a></li>
        <li><a href="{{ site.baseurl }}/docs/network/">网络配置与优化</a></li>
        <li><a href="{{ site.baseurl }}/docs/monitoring/">监控与日志</a></li>
      </ul>
    </div>
  </div>

  <div class="docs-features">
    <h2>文档特色</h2>
    <div class="features-grid">
      <div class="feature-item">
        <h3>📚 结构清晰</h3>
        <p>采用分层目录结构，便于快速定位所需信息</p>
      </div>
      <div class="feature-item">
        <h3>🔍 易于搜索</h3>
        <p>支持全文搜索，快速找到相关内容</p>
      </div>
      <div class="feature-item">
        <h3>📱 响应式设计</h3>
        <p>适配各种设备，随时随地阅读文档</p>
      </div>
      <div class="feature-item">
        <h3>🔄 持续更新</h3>
        <p>定期更新内容，保持技术文档的时效性</p>
      </div>
    </div>
  </div>

  <div class="docs-actions">
    <h2>开始使用</h2>
    <div class="action-buttons">
      <a href="{{ site.baseurl }}/docs/" class="btn btn-primary">浏览所有文档</a>
<a href="{{ site.baseurl }}/docs/rfc/" class="btn btn-outline">RFC 文档</a>
<a href="{{ site.baseurl }}/docs/sonic/" class="btn btn-outline">SONiC 架构</a>
<a href="{{ site.baseurl }}/docs/yumapro/" class="btn btn-outline">YumaPro 工具</a>
<a href="{{ site.baseurl }}/docs-test/" class="btn btn-outline">测试页面</a>
    </div>
  </div>
</div>

<style>
.docs-nav-page {
  max-width: 1000px;
  margin: 0 auto;
  padding: 40px 20px;
}

.docs-hero {
  text-align: center;
  margin-bottom: 60px;
  
  h1 {
    font-size: 3em;
    color: #333;
    margin-bottom: 20px;
    background: linear-gradient(135deg, #0366d6, #28a745);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  p {
    font-size: 1.2em;
    color: #666;
    max-width: 600px;
    margin: 0 auto;
  }
}

.docs-categories {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  margin-bottom: 60px;
}

.category-card {
  background: white;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 30px rgba(0,0,0,0.15);
  }
  
  .category-icon {
    font-size: 3em;
    margin-bottom: 20px;
  }
  
  h2 {
    color: #333;
    margin-bottom: 15px;
    font-size: 1.5em;
  }
  
  p {
    color: #666;
    margin-bottom: 20px;
    line-height: 1.6;
  }
  
  ul {
    list-style: none;
    padding: 0;
    margin: 0;
    
    li {
      margin-bottom: 8px;
      
      a {
        color: #0366d6;
        text-decoration: none;
        display: block;
        padding: 8px 0;
        border-radius: 4px;
        transition: all 0.2s ease;
        
        &:hover {
          background-color: #f8f9fa;
          color: #0246a2;
          padding-left: 10px;
        }
      }
    }
  }
}

.docs-features {
  margin-bottom: 60px;
  
  h2 {
    text-align: center;
    color: #333;
    margin-bottom: 40px;
    font-size: 2.2em;
  }
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 30px;
}

.feature-item {
  text-align: center;
  padding: 20px;
  
  h3 {
    color: #333;
    margin-bottom: 15px;
    font-size: 1.3em;
  }
  
  p {
    color: #666;
    line-height: 1.6;
  }
}

.docs-actions {
  text-align: center;
  
  h2 {
    color: #333;
    margin-bottom: 30px;
    font-size: 2.2em;
  }
}

.action-buttons {
  display: flex;
  gap: 20px;
  justify-content: center;
  flex-wrap: wrap;
}

.btn {
  display: inline-block;
  padding: 15px 30px;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 600;
  font-size: 1.1em;
  transition: all 0.3s ease;
  
  &.btn-primary {
    background: linear-gradient(135deg, #0366d6, #28a745);
    color: white;
    border: none;
    
    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(3, 102, 214, 0.3);
    }
  }
  
  &.btn-outline {
    border: 2px solid #0366d6;
    color: #0366d6;
    background: white;
    
    &:hover {
      background-color: #0366d6;
      color: white;
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(3, 102, 214, 0.3);
    }
  }
}

@media (max-width: 768px) {
  .docs-hero h1 {
    font-size: 2.2em;
  }
  
  .docs-categories {
    grid-template-columns: 1fr;
  }
  
  .action-buttons {
    flex-direction: column;
    align-items: center;
    
    .btn {
      width: 200px;
    }
  }
}
</style>
