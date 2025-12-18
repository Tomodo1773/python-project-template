# Python Project Template

このリポジトリは、モダンなPython開発環境を簡単に構築できるプロジェクトテンプレートです。
開発コンテナ、パッケージ管理、テスト、リンター、CI/CDなど、実践的な開発に必要な設定がすべて含まれています。

## 特徴

### 🚀 パッケージ管理 - uv

[uv](https://github.com/astral-sh/uv) を使用した高速なPythonパッケージ管理を実現しています。

- 高速な依存関係の解決とインストール
- `pyproject.toml` による依存関係の管理
- `uv.lock` によるロック機能で再現性を保証

```bash
# パッケージの追加
uv add <パッケージ名>

# 開発用パッケージの追加
uv add --dev <パッケージ名>

# 依存関係の同期
uv sync

# Pythonスクリプトの実行
uv run python main.py
```

### 🧪 テスト実行 - pytest

pytestによる包括的なテスト環境を構築しています。

**設定内容:**
- `pytest.ini` による詳細な設定
- `pytest-asyncio` による非同期テストのサポート
- `pytest-xdist` による並列テスト実行
- 詳細なログ出力設定

```bash
# テストの実行
uv run pytest

# 並列実行
uv run pytest -n auto

# 詳細出力
uv run pytest -v
```

### 🔧 コード品質管理 - Ruff + pre-commit

[Ruff](https://github.com/astral-sh/ruff) による高速なリンティングとフォーマットを自動化しています。

**pre-commit による自動実行:**
- コミット前に自動的にコードをチェック・修正
- Ruffのリンター（`ruff check`）とフォーマッター（`ruff format`）を実行
- line-length: 127文字に設定

```bash
# pre-commitのインストール
uv run pre-commit install

# 手動実行
uv run pre-commit run --all-files

# Ruffを直接実行
uv run ruff check .
uv run ruff format .
```

### 🤖 GitHub Actions

GitHub Actionsによる自動CI/CDパイプラインを構築しています。

**設定済みワークフロー:**

1. **Ruff チェック** (`.github/workflows/ruff.yml`)
   - プッシュ・プルリクエスト時に自動実行
   - コードスタイルとフォーマットをチェック

2. **pytest テスト** (`.github/workflows/pytest.yml`)
   - プッシュ・プルリクエスト時に自動実行
   - uvを使用した依存関係のインストール
   - 並列テスト実行（`pytest -n auto`）

### 🎭 act - ローカルでのActions実行

[act](https://github.com/nektos/act) を使用してGitHub Actionsをローカルで実行できます。

**設定内容:**
- `.actrc` による実行環境の設定
- `Makefile` による簡単なコマンド実行

```bash
# pytestワークフローのローカル実行
make act-pytest

# または直接actコマンドを実行
act -W .github/workflows/pytest.yml
```

### 🐳 Dev Container環境

VS Code Dev Containersを使用した統一された開発環境を提供しています。

**環境の特徴:**

#### ツールのインストール
- **Python 3.13** と **uv** がプリインストール
- **act** によるGitHub Actionsのローカル実行
- **Docker-in-Docker** のサポート
- **GitHub CLI (gh)** のインストール

#### ホストとの認証共有
開発コンテナ内でホストマシンの認証情報を共有できます：

- **Git設定の共有**: `~/.gitconfig` がコンテナ内で利用可能
- **GitHub CLI認証の共有**: `~/.config/gh` をマウントしてghコマンドの認証を共有
- **Codex認証の共有**: `~/.codex` をマウントして認証を共有

これにより、コンテナ内でもホストと同じ認証情報でGitHubにアクセス可能です。

#### プリインストールされたVS Code拡張機能
- **Ruff**: Pythonのリンティングとフォーマット
- **GitHub Copilot / Copilot Chat**: AI支援コーディング
- **Claude Code**: Anthropic Claude AI支援
- **ChatGPT**: OpenAI ChatGPT統合
- **GitLens**: 高度なGit統合
- **その他**: Prettier, indent-rainbow, markdownlint, mermaid, drawioなど


### 📝 その他の設定

#### Makefile
- `make requirements.txt`: `uv.lock`からrequirements.txtを生成
- `make act-pytest`: actを使用してpytestワークフローをローカル実行

## ライセンス

このプロジェクトのライセンスについては、[LICENSE](LICENSE)ファイルを参照してください。

## 貢献

Issue、Pull Requestはいつでも歓迎します！
