DATA_DIR =gs://ssystore1/mtf/data
MODEL_DIR=gs://ssystore1/mtf/transformer_standalone
TPU=ssy-mtf-ctpu

# MODEL HPARAMS AND DIRECTORY  (uncomment one)
# base model
MODEL=./transformer/gin/model_base.gin
# 5B parameters (too big for this dataset, only trains with model-parallelism)
# MODEL=./transformer/gin/model_5b.gin

# UNCOMMENT ONE OF THESE
# Data-parallelism
LAYOUT=./transformer/gin/layout_data_parallel.gin
# Model-parallelism
# LAYOUT=./transformer/gin/layout_model_parallel.gin
# Data-parallelism and Model-Parallelism
# LAYOUT=./transformer/gin/layout_data_and_model_parallel.gin

# TRAIN
python examples/transformer_standalone.py \
  --tpu=$TPU --data_dir=$DATA_DIR --model_dir=$MODEL_DIR --gin_file=$MODEL \
  --gin_file=$LAYOUT --gin_param="run.mode='train'"

# EVAL
python examples/transformer_standalone.py \
  --tpu=$TPU --data_dir=$DATA_DIR --model_dir=$MODEL_DIR --gin_file=$MODEL \
  --gin_file=$LAYOUT --gin_param="run.mode='evaluate'"
