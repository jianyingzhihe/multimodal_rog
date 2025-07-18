#!/bin/bash

SPLIT="val"
DATASET_LIST="OKVQA"
MODEL_NAME="llama"
MODEL_PATH="multimodels/meta-llama/llama"

BEAM_LIST="3" # "1 2 3 4 5"

cd $(dirname "$0")/../  # 切换到 RoG/qwen 目录

# 将 src 加入 PYTHONPATH，让 Python 可以直接访问 fileloader 等模块
export PYTHONPATH=$(pwd)/src:$PYTHONPATH

for DATASET in $DATASET_LIST; do
    for N_BEAM in $BEAM_LIST; do
        python src/gen_rule_path/gen_rule_path.py \
            --model_name ${MODEL_NAME} \
            --model_path ${MODEL_PATH} \
            -d ${DATASET} \
            --split ${SPLIT} \
            --n_beam ${N_BEAM}
    done
done