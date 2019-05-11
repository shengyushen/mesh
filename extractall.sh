# ./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.2.trace.json > trace2
# ./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.3.trace.json > trace3
# ./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.4.trace.json > trace4
# ./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.5.trace.json > trace5

grep cross-replica-sum trace2 | awk -F, '{print $6 " 2"}'> trace21
grep cross-replica-sum trace3 | awk -F, '{print $6 " 3"}'> trace31
grep cross-replica-sum trace4 | awk -F, '{print $6 " 4"}'> trace41
grep cross-replica-sum trace5 | awk -F, '{print $6 " 5"}'> trace51

./jsonConv.py anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_all_hosts.op_profile.json > allhost_op
awk '{if($0 ~ /\"expression.*cross-replica-sum\.[0-9]+ =/) print}' allhost_op |awk -F"cross-replica-sum" '{print $2}'|awk -F= '{gsub(/^[ ]+/,"",$1);gsub(/[ ]+$/,"",$1);gsub(/^[ ]+\(/,"",$2);gsub(/\)[ ]+$/,"",$2);split($2,arr3,", ");x5=0;for(i in arr3) {xx=arr3[i];gsub(/^.*\[/,"",xx);gsub(/\].*$/,"",xx);l=split(xx,arr4,",");xxx=1;for(i=1;i<=l;i=i+1 ) {xxx=xxx*arr4[i]};x5=x5+xxx;};print "cross-replica-sum" $1 "," x5}' > collect_size

#gnuplot -p -e ' plot "trace21" u 1:2 , "trace31" u 1:2 , "trace41" u 1:2 , "trace51" u 1:2'
cat collect_size trace2|awk -F, '{if($1 ~ /cross-replica-sum/) {arr[$1]=$2} else if($2 ~ /cross-replica-sum/){ print $6 " " arr[substr($2,2,length($2)-2)] }}' > trace22
cat collect_size trace3|awk -F, '{if($1 ~ /cross-replica-sum/) {arr[$1]=$2} else if($2 ~ /cross-replica-sum/){ print $6 " " arr[substr($2,2,length($2)-2)] }}' > trace32
cat collect_size trace4|awk -F, '{if($1 ~ /cross-replica-sum/) {arr[$1]=$2} else if($2 ~ /cross-replica-sum/){ print $6 " " arr[substr($2,2,length($2)-2)] }}' > trace42
cat collect_size trace5|awk -F, '{if($1 ~ /cross-replica-sum/) {arr[$1]=$2} else if($2 ~ /cross-replica-sum/){ print $6 " " arr[substr($2,2,length($2)-2)] }}' > trace52

rm -f trace_final
touch trace_final
awk '{print "2 " $0}' trace22 >> trace_final; echo "" >> trace_final
awk '{print "3 " $0}' trace32 >> trace_final; echo "" >> trace_final
awk '{print "4 " $0}' trace42 >> trace_final; echo "" >> trace_final
awk '{print "5 " $0}' trace52 >> trace_final; echo "" >> trace_final

gnuplot -p -e 'set xlabel "host"; set ylabel "time(us)"; set title "reduce data size(BF16)";splot "trace_final" u 1:2:3 w linesp '
