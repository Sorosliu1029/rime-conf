#!/bin/bash
# 安装／更新：雾凇拼音 + 万象语法模型 + 本仓库客製化文件
#
# 用法：bash install.sh
# 完成后在鼠鬚管菜单中「重新部署」

set -euo pipefail

rime_dir="${rime_dir:-$HOME/Library/Rime}"
plum_dir="${plum_dir:-$HOME/plum}"
repo_dir="$(cd "$(dirname "$0")" && pwd)"
gram_url="https://github.com/amzxyz/RIME-LMDG/releases/download/LTS/wanxiang-lts-zh-hans.gram"

if [ ! -d "$plum_dir" ]; then
  git clone --depth 1 https://github.com/rime/plum.git "$plum_dir"
fi

# 1. 雾凇拼音（方案、词库、Lua、OpenCC）
(cd "$plum_dir" && rime_dir="$rime_dir" bash rime-install iDvel/rime-ice:others/recipes/full)

# 2. 万象语法模型（约 200MB）；方案补靪见 double_pinyin_flypy.custom.yaml
curl -fL --retry 3 -o "$rime_dir/wanxiang-lts-zh-hans.gram.tmp" "$gram_url"
mv "$rime_dir/wanxiang-lts-zh-hans.gram.tmp" "$rime_dir/wanxiang-lts-zh-hans.gram"

# 3. 客製化文件
cp "$repo_dir"/*.custom.yaml "$repo_dir/custom_phrase_double.txt" "$rime_dir/"

echo "Done. Redeploy Squirrel (鼠鬚管 → 重新部署) to apply."
