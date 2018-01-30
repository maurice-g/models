#!/bin/bash
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
python object_detection/train.py --logtostderr --pipeline_config_path $1*.config --train_dir $1/train
