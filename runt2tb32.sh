t=$(date +"%Y-%m-%d-%H:%M:%S")

CONF=mtf_transformer_paper_tr_0_mesh_8
NAME=ende_$CONF\_0828
MODEL=mtf_transformer
PROBLEM=translate_ende_wmt32k_packed

DATA_DIR=gs://ssystore1/transformer/data
OUT_DIR=gs://ssystore1/anothertransformer${t}/out
TPU_NAME=ssy-mtf-ctpu

#gsutil rm -r ${OUT_DIR}

# distributed tpu always use  --schedule=train, because eval can not run in distributed tpu
/home/shengyushen_gmail_com/.local/bin/t2t-trainer \
  --model=$MODEL \
  --hparams_set=$CONF \
  --hparams='mesh_shape="batch:32"' \
  --schedule=train \
  --tpu_num_shards=32 \
  --problem=$PROBLEM \
  --train_steps=1000 \
  --eval_steps=200 \
  --data_dir=$DATA_DIR \
  --output_dir=$OUT_DIR \
  --use_tpu=True \
  --cloud_tpu_name=$TPU_NAME


