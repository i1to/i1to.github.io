FROM jekyll/jekyll:4.2.0

# 设置工作目录
WORKDIR /srv/jekyll

# 复制 Gemfile 和 Gemfile.lock
COPY Gemfile Gemfile.lock ./

# 安装依赖
RUN bundle install

# 复制所有文件
COPY . .

# 暴露端口
EXPOSE 4000

# 启动命令
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--livereload"]
