#./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.2.trace.json > trace2
#./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.3.trace.json > trace3
#./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.4.trace.json > trace4
#./extract.sh anothertransformer2019-05-08-07_47_48_output_plugins_profile_2019-05-08_07_52_02_10.240.1.5.trace.json > trace5

grep cross-replica-sum trace2 | awk -F, '{print $6 " 2"}'> trace21
grep cross-replica-sum trace3 | awk -F, '{print $6 " 3"}'> trace31
grep cross-replica-sum trace4 | awk -F, '{print $6 " 4"}'> trace41
grep cross-replica-sum trace5 | awk -F, '{print $6 " 5"}'> trace51

gnuplot -p -e ' plot "trace21" u 1:2 , "trace31" u 1:2 , "trace41" u 1:2 , "trace51" u 1:2'

