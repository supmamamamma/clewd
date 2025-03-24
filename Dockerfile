# 使用 alpine 版本作为基础镜像
FROM node:20.4-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 只安装生产依赖并清理缓存
RUN npm install --production --no-audit --fund false && \
    npm cache clean --force

# 复制应用程序代码
COPY . .

# 启动应用
CMD ["node", "clewd.js"]
