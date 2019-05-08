grep "checkpoints for 0 into" $1 | awk '{xx=substr($6,1,length($6)-1);n=split(xx,arr,"/");printf "capture_tpu_profile --tpu=ssy-mtf-ctpu  --logdir=" ; for(i=1;i<=n-2;i=i+1) {printf arr[i] "/"} ;print "output --num_tracing_attempts=10  --duration_ms=50000"}' > capture_gened.sh
#capture_tpu_profile --tpu=ssy-mtf-ctpu  --logdir=gs://ssystore1/anothertransformer/output --num_tracing_attempts=10  --duration_ms=50000

