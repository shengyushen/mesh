# https://cloud.google.com/tpu/docs/tutorials/mnist
# above is the url for this tutorial

export TPUNAME=ssy-mtf-ctpu
export BUCKET_NAME=gs://ssystore1
export PROJECT_NAME=transformer
export DATA=data
export MODEL=model
export OUT=out

export BASEDIR=${BUCKET_NAME}/${PROJECT_NAME}
export DATADIR=${BASEDIR}/${DATA}
export MODELDIR=${BASEDIR}/${MODEL}
export OUTDIR=${BASEDIR}/${OUT}

export TMPDIR=/tmp
export PATH=~/.local/bin:$PATH

