FROM node:20-alpine

# メンテナー情報
LABEL maintainer="your-email@example.com"

# 作業ディレクトリ設定
WORKDIR /usr/src/app

# 依存関係ファイルをコピー
COPY app/package*.json ./

# 依存関係のインストール
RUN npm install

# アプリケーションのソースコードをコピー
COPY app/ .

# ポートを公開
EXPOSE 3000

# 開発サーバー起動
CMD ["npm", "run", "dev"]