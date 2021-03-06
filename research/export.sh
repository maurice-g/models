#!/bin/bash
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
global_step=0000000
objdetpath=$(pwd)
cd $1 && python $objdetpath/object_detection/export_inference_graph.py --pipeline_config_path $1*.config --input_type encoded_image_string_tensor --trained_checkpoint_prefix $1/train/$2 --output_directory $3
mv $3/saved_model/ $3/$global_step
cp $3/pipeline.config $3/$global_step
