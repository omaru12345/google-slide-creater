# google-slide-creater

## ブランチ戦略 (Branching Strategy)

このリポジトリは、`main`、`stg`（ステージング）、`dev`（開発）の3つの主要なブランチを使用しています。

詳細は [BRANCHING.md](./BRANCHING.md) を参照してください。

### ブランチの作成

dev と stg ブランチを作成するには、以下のいずれかの方法を使用します：

1. **GitHub Actions（推奨）**: Actions タブから "Create Dev and Stg Branches" ワークフローを実行
2. **スクリプト**: `./scripts/create-branches.sh` を実行
3. **手動**: git コマンドで直接作成

---

This repository uses three main branches: `main`, `stg` (staging), and `dev` (development).

For details, see [BRANCHING.md](./BRANCHING.md).

### Creating Branches

To create the dev and stg branches, use one of the following methods:

1. **GitHub Actions (Recommended)**: Run the "Create Dev and Stg Branches" workflow from the Actions tab
2. **Script**: Run `./scripts/create-branches.sh`
3. **Manual**: Create directly with git commands