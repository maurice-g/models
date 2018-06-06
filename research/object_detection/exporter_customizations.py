import tensorflow as tf
import numpy as np
import operator
from object_detection.utils.label_map_util import get_label_map_dict, load_labelmap


def add_human_readable_labels(postprocessed_tensors, labelmap_path):
  # add human readable labels to output
  labelmap = get_label_map_dict(labelmap_path)

  labels = [item[0].encode('utf-8') for item in sorted(labelmap.items(), key=operator.itemgetter(1))]
  print('labels:',labels)

  def _lookup_string_from_index(tf_indices, descriptions):
    # lookup utility for tensors
    tf_class_descriptions = tf.constant(descriptions)
    table = tf.contrib.lookup.index_to_string_table_from_tensor(
        tf_class_descriptions, default_value="__UNKNOWN__")
    return table.lookup(tf.to_int64(tf_indices))

  class_descriptions = _lookup_string_from_index(postprocessed_tensors.get('detection_classes'), labels)
  postprocessed_tensors['class_descriptions'] = class_descriptions
  return postprocessed_tensors
