#!/usr/bin/env bash
export ROOT=/mnt/hdd1/wangtianxing/mlebench-baseline
export CONDA_PKGS_DIRS="$ROOT/pkgs"
export KAGGLE_CONFIG_DIR="$ROOT/.secrets/kaggle"
export MLEBENCH_DATA_DIR="$ROOT/data/mlebench"

source /mnt/ssd1/wangtianxing/miniconda3/etc/profile.d/conda.sh
conda activate "$ROOT/env"

cd "$ROOT/repos/mle-bench"
