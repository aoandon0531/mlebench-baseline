# MLE-Bench Baseline Environment for `nomad2018`

这是一个用于在学校服务器上复现 **MLE-Bench** 最小基线任务 `nomad2018-predict-transparent-conductors` 的环境模板仓库。

本仓库的目标不是提供完整实验结果，而是提供一套**可迁移、可复现、可快速验证**的最小工作流，方便其他人直接在自己的服务器上复用相同流程，以尽量对齐环境与结论。

---

## 1. 项目目标

当前阶段的目标是：

- 在学校服务器上配置一套可复现的 MLE-Bench 运行环境
- 使用 `nomad2018-predict-transparent-conductors` 作为最小验证任务
- 将环境搭建、数据准备、最小验证流程脚本化
- 让其他人可以迁移这套仓库，并在自己的机器上快速复现

---

## 2. 当前验证范围

本仓库当前验证的是以下最小闭环：

1. 创建 Python 环境
2. 安装 `mle-bench`
3. 拉取 `git lfs` 相关内容
4. 使用 Kaggle API 准备 `nomad2018-predict-transparent-conductors`
5. 运行 `mlebench grade-sample`
6. 成功得到结构化评分输出

当前不包含：

- 大规模 benchmark
- 多 agent 框架统一调度
- 长程任务自动化评测
- 全量 MLE-Bench competition 准备

---

## 3. 目录结构

推荐目录结构如下：

```text
mlebench-baseline/
├── README.md
├── .gitignore
├── scripts/
│   ├── activate.sh
│   ├── bootstrap.sh
│   ├── prepare_nomad.sh
│   ├── smoke_test.sh
│   └── freeze_env.sh
├── manifests/
│   ├── python.txt
│   ├── pip-freeze.txt
│   ├── conda-from-history.yml
│   ├── uname.txt
│   ├── gpu.txt
│   ├── mlebench-commit.txt
│   └── git-lfs-version.txt
├── repos/
│   └── mle-bench/
├── data/
│   └── mlebench/
├── logs/
├── pkgs/
├── env/
└── .secrets/
    └── kaggle/
        └── kaggle.json
