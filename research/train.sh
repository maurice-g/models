#!/bin/bash
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
objdetpath=$(pwd)
cd $1 && python $objdetpath/object_detection/legacy/train.py --logtostderr --pipeline_config_path $1*.config --train_dir $1/train
