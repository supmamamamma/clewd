# 使用 alpine 版本作为基础镜像
FROM node:20.4-alpine

# 设置工作目录
WORKDIR /app

# 安装必要的系统依赖
RUN apk add --no-cache \
    ca-certificates \
    libc6-compat

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 只安装生产依赖并清理缓存
RUN npm install --production --no-audit --fund false && \
    npm cache clean --force

# 复制应用程序代码
COPY . .

# 确保二进制文件有执行权限
RUN mkdir -p bin && \
    chmod -R +x bin/

# 启动应用
CMD ["node", "clewd.js"]
