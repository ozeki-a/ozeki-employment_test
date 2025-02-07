# GitHubへのSSHキー登録手順

## 概要
生成したSSHキーをGitHubアカウントに登録する手順を説明します。

## 前提条件
- GitHubアカウントを作成済み
- ed25519形式のSSHキーを作成済み（[作成手順](1-create_ssh_key.md)）

## 手順

1. 公開キーをコピーします
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
   ※ `ssh-ed25519`で始まる行全体をコピーしてください

2. GitHubに公開キーを登録します
   1. GitHubにログインします
   2. 右上のプロフィールアイコン → `Settings`をクリックします
   3. 左メニューから`SSH and GPG keys`を選択します
   4. `New SSH key`をクリックします
   5. 以下の項目を入力します：
      - Title：キーの識別名（例：MacBook Pro）
      - Key type：`Authentication Key`
      - Key：コピーした公開キー
   6. `Add SSH key`をクリックします

3. 接続をテストします
   ```bash
   ssh -T git@github.com
   ```
   以下のメッセージが表示されれば成功です：
   ```
   Hi username! You've successfully authenticated, but GitHub does not provide shell access.
   ```

## 注意事項
- 公開キー（.pub）のみを登録してください
- 秘密キーは絶対に共有しないでください
- SSHキーは1デバイスにつき1つ作成してください