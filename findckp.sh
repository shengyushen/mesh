grep "checkpoints for 0 into" *.log|awk '{print substr($6,1,length($6)-1)}'|sort|uniq

