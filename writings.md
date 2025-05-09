---
layout: page
title: 技术文章
permalink: /writings/
---

# <img src='/images/icons/writings.svg' alt='' class="icon"/>&nbsp;<span class='jump-effect'>技术文章</span>

<big>这里收集了我的技术文章，包括学习笔记、教程和心得体会。</big>

<ul class="post-list">
  {% assign writings_posts = site.posts | where: "categories", "Diary" | sort: "date" | reverse %}
  {% for post in writings_posts %}
    <li>
      <h2>
        <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
      </h2>
      <div class="post-meta">
        <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
        {% if post.categories.size > 0 %}
        <span class="post-categories">
          分类：
          {% for category in post.categories %}
            <a href="/categories/#{{ category | slugify }}">{{ category }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </span>
        {% endif %}
        {% if post.tags.size > 0 %}
        <span class="post-tags">
          标签：
          {% for tag in post.tags %}
            <a href="/tags/#{{ tag | slugify }}">{{ tag }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </span>
        {% endif %}
      </div>
      <div class="post-excerpt">
        {{ post.excerpt }}
      </div>
      <a href="{{ post.url | relative_url }}" class="post-read-more">阅读更多 →</a>
    </li>
  {% endfor %}
</ul>

{% if writings_posts.size == 0 %}
<p>暂无文章。</p>
{% endif %}
