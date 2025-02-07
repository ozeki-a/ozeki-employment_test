# SSHキーの作成方法 (ed25519形式)

## 概要
ed25519形式のSSHキーを作成する手順を説明します。

## 前提条件
- macOS

## 手順

1. ターミナルを開きます

2. SSHキーを生成します
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```
   ※ GitHubに登録したメールアドレスを入力してください

3. 保存場所を指定します
   ```bash
   Enter file in which to save the key (/Users/USERNAME/.ssh/id_ed25519):
   ```
   - デフォルトの場所でよい場合：Enterキーを押します
   - 別の場所に保存する場合：保存先のパスを入力します

4. パスフレーズを設定します
   ```bash
   Enter passphrase (empty for no passphrase):
   Enter same passphrase again:
   ```

5. 公開鍵を確認します
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
   以下の形式で表示されることを確認します：
   ```
   ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... your_email@example.com
   ```

## 注意事項
- パスフレーズは忘れないように管理してください

## 補足：SSHキーについて
SSHキーは以下の2つのファイルがペアで生成されます：

1. 秘密鍵（Private Key）
   - ファイル名: `id_ed25519`
   - 場所: `~/.ssh/id_ed25519`
   - このファイルは自分のパソコンのみに保管し、他人と共有してはいけません

2. 公開鍵（Public Key）
   - ファイル名: `id_ed25519.pub`
   - 場所: `~/.ssh/id_ed25519.pub`
   - このファイルをGitHubに登録します
   - `.pub`という拡張子が付いているのが公開鍵です