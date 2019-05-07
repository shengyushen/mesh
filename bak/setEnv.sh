#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage : setEnv.sh <num_shards>"
fi

export SHARDS=$1
export TPUNAME=ssy-mtf-ctpu
export BUCKET_NAME=gs://ssystore1
export PROJECTNAME=mtf_transformer

export DATADIR=${BUCKET_NAME}/${PROJECTNAME}/data_${SHARDS}
export TMPDIR=/tmp

export TIMESSY=$(date +"%Y-%m-%d-%H:%M:%S")
export OUTDIR=${BUCKET_NAME}/${PROJECTNAME}/out_${TIMESSY}

export PROBLEM=translate_ende_wmt32k_packed
export CONF=mtf_transformer_paper_tr_0_mesh_8
export NAME=ende_$CONF\_0828
export MODEL=${PROJECTNAME}

