---
layout: page
title: 文档系统测试页面
permalink: /docs-test/
---

<div class="test-page">
  <div class="test-header">
    <h1>📚 文档系统测试页面</h1>
    <p>展示从 GitBook 迁移到 Jekyll 文档系统的效果</p>
  </div>

  <div class="test-sections">
    <div class="test-section">
      <h2>🌐 网络技术文档</h2>
      <div class="test-cards">
        <div class="test-card">
          <h3>RFC 网络协议文档</h3>
          <p>包含 NETCONF、YANG 等网络协议的中英对照文档</p>
          <div class="test-links">
            <a href="{{ site.baseurl }}/docs/rfc/" class="btn btn-primary">查看 RFC 文档</a>
            <a href="{{ site.baseurl }}/docs/rfc/rfc6241/" class="btn btn-outline">RFC 6241</a>
            <a href="{{ site.baseurl }}/docs/rfc/rfc4742/" class="btn btn-outline">RFC 4742</a>
          </div>
        </div>
        
        <div class="test-card">
          <h3>SONiC 架构文档</h3>
          <p>SONiC 网络操作系统的详细架构分析</p>
          <div class="test-links">
            <a href="{{ site.baseurl }}/docs/sonic/" class="btn btn-primary">查看 SONiC 文档</a>
            <a href="{{ site.baseurl }}/docs/sonic/redis-wrappers/" class="btn btn-outline">Redis Wrappers</a>
          </div>
        </div>
      </div>
    </div>

    <div class="test-section">
      <h2>🛠️ 开发工具文档</h2>
      <div class="test-cards">
        <div class="test-card">
          <h3>Jekyll 博客搭建</h3>
          <p>Jekyll 静态网站生成器的使用指南</p>
          <div class="test-links">
            <a href="{{ site.baseurl }}/docs/jekyll/" class="btn btn-primary">查看 Jekyll 文档</a>
            <a href="{{ site.baseurl }}/blog-architecture.md" class="btn btn-outline">博客架构说明</a>
          </div>
        </div>
        
        <div class="test-card">
          <h3>GitHub Actions 配置</h3>
          <p>GitHub Actions 自动化部署配置指南</p>
          <div class="test-links">
            <a href="{{ site.baseurl }}/docs/github-actions/" class="btn btn-primary">查看 GitHub Actions 文档</a>
          </div>
        </div>
      </div>
    </div>

    <div class="test-section">
      <h2>📊 功能特性展示</h2>
      <div class="features-grid">
        <div class="feature-item">
          <div class="feature-icon">📱</div>
          <h3>响应式设计</h3>
          <p>适配各种设备屏幕，提供最佳阅读体验</p>
        </div>
        
        <div class="feature-item">
          <div class="feature-icon">🔍</div>
          <h3>自动目录生成</h3>
          <p>JavaScript 自动提取标题生成目录导航</p>
        </div>
        
        <div class="feature-item">
          <div class="feature-icon">🎨</div>
          <h3>现代化界面</h3>
          <p>采用卡片式设计，悬停效果和动画</p>
        </div>
        
        <div class="feature-item">
          <div class="feature-icon">📝</div>
          <h3>Markdown 支持</h3>
          <p>支持代码高亮、表格、列表等丰富格式</p>
        </div>
      </div>
    </div>

    <div class="test-section">
      <h2>🔄 迁移对比</h2>
      <div class="comparison-table">
        <table>
          <thead>
            <tr>
              <th>特性</th>
              <th>原 GitBook</th>
              <th>新 Jekyll 文档系统</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>左侧导航</td>
              <td>✅ 自动生成</td>
              <td>✅ 手动配置，更灵活</td>
            </tr>
            <tr>
              <td>多主题支持</td>
              <td>✅ 内置主题</td>
              <td>🔄 可自定义主题</td>
            </tr>
            <tr>
              <td>搜索功能</td>
              <td>✅ 内置搜索</td>
              <td>🔄 可集成搜索</td>
            </tr>
            <tr>
              <td>响应式设计</td>
              <td>✅ 支持</td>
              <td>✅ 完全支持</td>
            </tr>
            <tr>
              <td>代码高亮</td>
              <td>✅ 支持</td>
              <td>✅ 使用 Rouge</td>
            </tr>
            <tr>
              <td>自动目录</td>
              <td>✅ 支持</td>
              <td>✅ JavaScript 生成</td>
            </tr>
            <tr>
              <td>版本控制</td>
              <td>❌ 有限支持</td>
              <td>✅ 完全 Git 集成</td>
            </tr>
            <tr>
              <td>自定义程度</td>
              <td>❌ 有限</td>
              <td>✅ 完全可定制</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="test-section">
      <h2>🚀 快速开始</h2>
      <div class="quick-start">
        <div class="step">
          <div class="step-number">1</div>
          <div class="step-content">
            <h3>浏览文档</h3>
            <p>点击上方链接浏览各种技术文档</p>
          </div>
        </div>
        
        <div class="step">
          <div class="step-number">2</div>
          <div class="step-content">
            <h3>使用导航</h3>
            <p>使用左侧导航菜单快速定位内容</p>
          </div>
        </div>
        
        <div class="step">
          <div class="step-number">3</div>
          <div class="step-content">
            <h3>查看目录</h3>
            <p>在文档页面查看自动生成的目录</p>
          </div>
        </div>
        
        <div class="step">
          <div class="step-number">4</div>
          <div class="step-content">
            <h3>编辑文档</h3>
            <p>点击"编辑此页面"按钮直接修改内容</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
.test-page {
  max-width: 1200px;
  margin: 0 auto;
  padding: 40px 20px;
}

.test-header {
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
  }
}

.test-sections {
  display: flex;
  flex-direction: column;
  gap: 50px;
}

.test-section {
  h2 {
    color: #333;
    margin-bottom: 30px;
    font-size: 2.2em;
    border-bottom: 3px solid #0366d6;
    padding-bottom: 15px;
  }
}

.test-cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 30px;
}

.test-card {
  background: white;
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 30px rgba(0,0,0,0.15);
  }
  
  h3 {
    color: #333;
    margin-bottom: 15px;
    font-size: 1.5em;
  }
  
  p {
    color: #666;
    margin-bottom: 20px;
    line-height: 1.6;
  }
}

.test-links {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
}

.btn {
  display: inline-block;
  padding: 10px 20px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 600;
  font-size: 0.9em;
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

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 30px;
}

.feature-item {
  text-align: center;
  padding: 30px 20px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
  
  &:hover {
    transform: translateY(-5px);
  }
  
  .feature-icon {
    font-size: 3em;
    margin-bottom: 20px;
  }
  
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

.comparison-table {
  overflow-x: auto;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  
  table {
    width: 100%;
    border-collapse: collapse;
    
    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }
    
    th {
      background-color: #f8f9fa;
      font-weight: 600;
      color: #333;
    }
    
    tr:hover {
      background-color: #f9f9f9;
    }
  }
}

.quick-start {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 30px;
}

.step {
  display: flex;
  align-items: flex-start;
  gap: 20px;
  padding: 20px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  
  .step-number {
    width: 40px;
    height: 40px;
    background: linear-gradient(135deg, #0366d6, #28a745);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 1.2em;
    flex-shrink: 0;
  }
  
  .step-content {
    h3 {
      color: #333;
      margin-bottom: 10px;
      font-size: 1.2em;
    }
    
    p {
      color: #666;
      line-height: 1.6;
      margin: 0;
    }
  }
}

@media (max-width: 768px) {
  .test-header h1 {
    font-size: 2.2em;
  }
  
  .test-cards {
    grid-template-columns: 1fr;
  }
  
  .features-grid {
    grid-template-columns: 1fr;
  }
  
  .quick-start {
    grid-template-columns: 1fr;
  }
  
  .test-links {
    flex-direction: column;
    
    .btn {
      text-align: center;
    }
  }
}
</style>
