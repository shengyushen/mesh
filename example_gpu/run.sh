NOW=$(date +"%F-%T")
LOGFILE="$1-$NOW.log"
echo "$LOGFILE"
OUTFILE="$1-$NOW.out"
echo "$OUTFILE"
NVVPFILE="$1-$NOW.nvvp" 
echo "$NVVPFILE"
NVPROF_FLAG="-f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file $LOGFILE -o $NVVPFILE"
nvprof $NVPROF_FLAG   python3 /root/ssy/mesh/examples/mnist_${1}.py 2> >(tee $OUTFILE)
