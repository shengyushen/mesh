#gsutil rm -r ${OUTDIR}

/home/shengyushen_gmail_com/.local/bin/t2t-trainer \
  --model=$MODEL \
  --hparams_set=$CONF \
  --hparams='mesh_shape=batch:32' \
  --problem=$PROBLEM \
  --train_steps=1000 \
  --eval_steps=200 \
  --data_dir=$DATADIR \
  --output_dir=$OUTDIR \
  --use_tpu=True \
  --cloud_tpu_name=$TPUNAME
