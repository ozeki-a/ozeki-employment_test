# GPGキー作成手順 (ed25519形式)

## 概要
ed25519形式のGPGキーを作成する手順を説明します。

## 前提条件
- macOS
- Homebrewがインストール済み

## 手順

1. GPGをインストールします
   ```bash
   brew install gnupg
   ```

2. GPGキーを生成します
   ```bash
   gpg --full-generate-key
   ```

3. 以下の選択肢を入力します
   1. キーの種類：`9`（ECC 署名と暗号化）を選択
   2. 楕円曲線：`1`（Curve 25519）を選択
   3. 有効期限：`2y`（2年）を入力
   4. 設定確認：`y`を入力
   5. 個人情報を入力：
      - 名前：GitHubのユーザー名
      - メール：GitHubのメールアドレス
      - コメント：空でOK
   6. パスフレーズを設定

4. 生成したキーを確認します
   ```bash
   gpg --list-secret-keys --keyid-format LONG
   ```
   表示例：
   ```
   sec   ed25519/3AA5C34371567BD2 2023-11-01 [SC] [expires: 2025-11-01]
         86E35E077D9F23F37E95F767486E35E077D9F23F
   uid                 [ultimate] Your Name <your.email@example.com>
   ```

5. 公開キーをエクスポートします
   ```bash
   gpg --armor --export あなたのキーID
   ```
   ※ キーIDは手順4で表示された`3AA5C34371567BD2`の部分です

6. Gitの設定を更新します
   ```bash
   git config --global user.signingkey あなたのキーID
   git config --global commit.gpgsign true
   ```

## 注意事項
- パスフレーズは忘れないように保管してください
- キーの有効期限が切れる前に更新してください

## 補足：GPGキーについて
GPGキー（GNU Privacy Guard）は、コミットの署名に使用する電子署名用の鍵です：

1. GPGキーの役割
   - コミットが本当にあなたによって行われたことを証明します
   - GitHubでコミットに`Verified`バッジが表示されます
   - コードの信頼性と安全性を高めます

2. キーの種類
   - 秘密鍵：署名の作成に使用する秘密の鍵
   - 公開鍵：署名の検証に使用する公開の鍵
   
3. キーID
   - 形式：`3AA5C34371567BD2`のような16文字の英数字
   - GPGコマンドやGitの設定で使用します
   - `gpg --list-secret-keys`で確認できます