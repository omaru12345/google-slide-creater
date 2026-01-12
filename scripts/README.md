# Scripts

このディレクトリには、リポジトリの管理に役立つスクリプトが含まれています。

## create-branches.sh

`dev` と `stg` ブランチを作成するためのスクリプトです。

### 使い方

```bash
chmod +x scripts/create-branches.sh
./scripts/create-branches.sh
```

このスクリプトは以下を実行します：
- `dev` ブランチが存在しない場合、作成してリモートにプッシュ
- `stg` ブランチが存在しない場合、作成してリモートにプッシュ
- ブランチが既に存在する場合はスキップ

---

# Scripts

This directory contains scripts to help manage the repository.

## create-branches.sh

Script to create `dev` and `stg` branches.

### Usage

```bash
chmod +x scripts/create-branches.sh
./scripts/create-branches.sh
```

This script will:
- Create and push the `dev` branch if it doesn't exist
- Create and push the `stg` branch if it doesn't exist
- Skip if branches already exist
