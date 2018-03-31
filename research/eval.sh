#!/bin/bash
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
python object_detection/eval.py --logtostderr --pipeline_config_path $1/train/*.config --checkpoint_dir $1/train --eval_dir $1/eval
