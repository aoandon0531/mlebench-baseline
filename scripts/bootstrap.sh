#!/usr/bin/env bash
set -euo pipefail

export ROOT=/mnt/hdd1/wangtianxing/mlebench-baseline
export CONDA_PKGS_DIRS="$ROOT/pkgs"

mkdir -p "$ROOT"/{env,pkgs,repos,data/mlebench,scripts,manifests,logs,.secrets/kaggle}

source /mnt/ssd1/wangtianxing/miniconda3/etc/profile.d/conda.sh

conda create -y -p "$ROOT/env" python=3.11 pip || true
conda activate "$ROOT/env"

python -m pip install -U pip setuptools wheel

if [ ! -d "$ROOT/repos/mle-bench/.git" ]; then
  git clone https://github.com/openai/mle-bench.git "$ROOT/repos/mle-bench"
fi

cd "$ROOT/repos/mle-bench"
pip install -e .

if ! command -v git-lfs >/dev/null 2>&1; then
  conda install -y conda-forge::git-lfs
fi

git lfs install
git lfs fetch --all
git lfs pull
