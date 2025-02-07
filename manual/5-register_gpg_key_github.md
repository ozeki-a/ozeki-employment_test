# GitHubへのGPGキー登録手順

## 前提条件
- GitHubアカウントを作成済み
- GPGキーを生成済み（[作成手順](4-create_gpg_key.md)）
- GitのGPG設定を完了済み

## 前提条件
- GitHubアカウントを作成済み
- GPGキーを生成済み
- GitのGPG設定を完了済み

## 手順

1. GPGキーのIDを確認します
   ```bash
   gpg --list-secret-keys --keyid-format LONG
   ```
   ※ `sec ed25519/3AA5C34371567BD2` の `3AA5C34371567BD2` がキーIDです

2. 公開キーをエクスポートします
   ```bash
   gpg --armor --export あなたのキーID
   ```
   ※ 表示された内容（BEGIN PGP PUBLIC KEY BLOCK から END PGP PUBLIC KEY BLOCK まで）をコピーします

3. GitHubに公開キーを登録します
   1. GitHubにログインします
   2. 右上のプロフィールアイコン → `Settings`をクリックします
   3. 左メニューから`SSH and GPG keys`を選択します
   4. `New GPG key`をクリックします
   5. 以下の項目を入力します：
      - Title：キーの識別名（例：MacBook Pro）
      - Key：コピーした公開キー
   6. `Add GPG key`をクリックします

4. 署名付きコミットを作成します
   ```bash
   # 単発の署名付きコミット
   git commit -S -m "コミットメッセージ"

   # すべてのコミットで署名を有効化
   git config --global commit.gpgsign true
   ```

5. コミットを確認します
   - GitHubのコミット履歴で`Verified`バッジが表示されることを確認します

## 注意事項
- 公開キーのみをGitHubに登録してください
- コミット時のメールアドレスは、GPGキーに登録したものと同じにしてください
- GPGキーの有効期限が切れる前に更新してください