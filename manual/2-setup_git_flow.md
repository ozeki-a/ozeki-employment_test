# Git-flowのセットアップ手順

## 概要
Git-flowのインストールと設定方法を説明します。

## インストール手順

1. ターミナルを開きます

2. Git-flowをインストールします
   ```bash
   brew install git-flow-avh
   ```

3. インストールを確認します
   ```bash
   git flow version
   ```

## 初期設定

1. プロジェクトフォルダに移動します
   ```bash
   cd your-project-directory
   ```

2. Git-flowを初期化します
   ```bash
   git flow init
   ```

3. ブランチ名を設定します
   ```bash
   Branch name for production releases: [main]
   Branch name for "next release" development: [develop]
   Feature branches? [feature/]
   Bugfix branches? [bugfix/]
   Release branches? [release/]
   Hotfix branches? [hotfix/]
   Support branches? [support/]
   Version tag prefix? []
   ```
   ※ []内の値はデフォルト値です。特に理由がなければそのままEnterを押してください

## ブランチの種類

- main: 本番環境用
- develop: 開発用
- feature/*: 新機能開発用
- release/*: リリース準備用
- hotfix/*: 緊急バグ修正用
- bugfix/*: バグ修正用
- support/*: レガシーバージョン用

## 基本的な使い方

1. 新機能の開発を始める
   ```bash
   git flow feature start 機能名
   ```

2. 新機能の開発を完了する
   ```bash
   git flow feature finish 機能名
   ```

3. リリースを開始する
   ```bash
   git flow release start バージョン番号
   ```

4. リリースを完了する
   ```bash
   git flow release finish バージョン番号
   ```

5. 緊急のバグ修正を行う
   ```bash
   git flow hotfix start バグ修正名
   ```