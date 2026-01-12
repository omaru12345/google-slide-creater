# ブランチ戦略 (Branching Strategy)

このリポジトリでは、以下のブランチ戦略を使用しています。

## ブランチ構成

### main
- 本番環境に対応するブランチ
- 安定版のコードのみがマージされます
- 直接プッシュは禁止され、Pull Requestを通じてのみ更新されます

### stg (Staging)
- ステージング環境に対応するブランチ
- 本番環境にデプロイする前の最終確認用
- devブランチから本番リリース前にマージされます

### dev (Development)
- 開発環境に対応するブランチ
- 開発中の機能が統合されるブランチ
- feature/*ブランチからマージされます

### feature/*
- 新機能開発用のブランチ
- devブランチから作成し、完了後にdevにマージします

## ワークフロー

1. 新機能開発時: `dev`から`feature/*`ブランチを作成
2. 開発完了後: `feature/*`を`dev`にマージ
3. ステージング確認: `dev`を`stg`にマージ
4. 本番リリース: `stg`を`main`にマージ

## ブランチの作成方法

### 自動作成（推奨）
GitHub Actionsワークフローを使用して自動的にブランチを作成できます：

1. GitHubリポジトリの「Actions」タブに移動
2. 「Create Dev and Stg Branches」ワークフローを選択
3. 「Run workflow」をクリック

### 手動作成
スクリプトを使用して手動でブランチを作成することもできます：

```bash
chmod +x scripts/create-branches.sh
./scripts/create-branches.sh
```

または、直接gitコマンドで作成：

```bash
# devブランチの作成
git checkout -b dev
git push origin dev

# stgブランチの作成
git checkout -b stg
git push origin stg
```

## ブランチ保護ルール（推奨）

以下のブランチには保護ルールを設定することを推奨します：

- **main**: 
  - Pull Requestを必須にする
  - レビュー承認を必須にする
  - ステータスチェックを必須にする

- **stg**:
  - Pull Requestを必須にする
  - レビュー承認を必須にする

- **dev**:
  - Pull Requestを推奨

---

# Branching Strategy (English)

This repository uses the following branching strategy.

## Branch Structure

### main
- Production branch
- Only stable code is merged
- Direct pushes are prohibited; updates only through Pull Requests

### stg (Staging)
- Staging environment branch
- Final verification before production deployment
- Merged from dev branch before production release

### dev (Development)
- Development environment branch
- Integration branch for features under development
- Merged from feature/* branches

### feature/*
- Feature development branches
- Created from dev branch and merged back to dev when complete

## Workflow

1. New feature development: Create `feature/*` branch from `dev`
2. After development: Merge `feature/*` to `dev`
3. Staging verification: Merge `dev` to `stg`
4. Production release: Merge `stg` to `main`

## How to Create Branches

### Automatic Creation (Recommended)
Use the GitHub Actions workflow to automatically create branches:

1. Navigate to the "Actions" tab in the GitHub repository
2. Select the "Create Dev and Stg Branches" workflow
3. Click "Run workflow"

### Manual Creation
You can also manually create branches using the script:

```bash
chmod +x scripts/create-branches.sh
./scripts/create-branches.sh
```

Or create directly with git commands:

```bash
# Create dev branch
git checkout -b dev
git push origin dev

# Create stg branch
git checkout -b stg
git push origin stg
```

## Branch Protection Rules (Recommended)

It is recommended to set protection rules for the following branches:

- **main**: 
  - Require Pull Requests
  - Require review approval
  - Require status checks

- **stg**:
  - Require Pull Requests
  - Require review approval

- **dev**:
  - Recommend Pull Requests
