#!/bin/bash
set -e

echo "🚀 开始部署 OpenClaw..."

# Cloudflare API 直接连接
export CLOUDFLARE_API_TOKEN='jrFREdDAZT3K0FWdMuW9dTtDBjB4b5vwWPBxbHrP'

# Docker 使用代理
export HTTP_PROXY=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890

echo "📦 构建 Worker..."
npm run build

echo "☁️ 部署到 Cloudflare..."
# 使用子进程运行 wrangler，使其继承代理设置
env -u HTTP_PROXY -u HTTPS_PROXY npx wrangler deploy

echo "✅ 部署完成!"
echo ""
echo "🌐 访问地址:"
echo "   https://moltbot-sandbox.ymcharvey.workers.dev/?token=2bff9bb4b16b913f536bfa7a47eb07525052063912dd8da9f243a631f578452f"
