import subprocess
import sys

themes = [
    "jdinhlife.gruvbox",
    "sainnhe.gruvbox-material",
]
python = [
    "ms-python.debugpy",
    "ms-python.mypy-type-checker",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "ms-python.vscode-python-envs",
    "charliermarsh.ruff",
]
rust = [
    "rust-lang.rust-analyzer",
    "rust10x.rust10x",
]
go = [
    "golang.go",
]
common = [
    *themes,
    *python,
    *rust,
    *go,
    "bierner.markdown-mermaid",
    "maattdd.gitless",
    "ms-vscode-remote.remote-containers",
    "redhat.vscode-yaml",
    "stkb.rewrap",
    "tamasfe.even-better-toml",
]

nixos = [
    "bbenoist.nix",
    "kamadorueda.alejandra",
]
linux = [
    *common,
    *nixos,
]
macos = [
    *common,
]

if __name__ == "__main__":
    args = sys.argv
    if len(args) < 2:
        raise SystemExit("Need to pass a group")
    group = args[1]
    if not (extensions := locals().get(group)):
        raise SystemExit(f"Unknown group {group}")

    print(f"Installing group {group}")
    for extension in extensions:
        subprocess.run(f"code --install-extension {extension}", shell=True)
