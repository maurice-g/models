#!/bin/bash
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
python object_detection/export_inference_graph.py --pipeline_config_path $1*.config --input_type encoded_image_string_tensor --trained_checkpoint_prefix $1$2 --output_directory $3
