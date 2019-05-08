grep "checkpoints for 0 into" $1 | awk '{xx=substr($6,1,length($6)-1);n=split(xx,arr,"/");printf "tensorboard  --logdir=" ; for(i=1;i<=n-2;i=i+1) {printf arr[i] "/"} ;print "output"}' > gened_tnsbrd.sh
#tensorboard --logdir=gs://ssystore1/anothertransformer/output

