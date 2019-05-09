#!/usr/bin/gnuplot
set xlabel "number of GPU"
set ylabel "run time of 4 epoches(s)"
plot "time" u 2:(stringcolumn(1) eq "dp"?$3:1/0) with linesp title "data parallel",\
         "" u 2:(stringcolumn(1) eq "mp"?$3:1/0) with linesp title "model parallel"
