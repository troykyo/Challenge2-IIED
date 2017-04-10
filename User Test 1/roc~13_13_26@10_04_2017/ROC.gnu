set term png enhanced size 1024,1024 lw 3 font "Times,32"
set output '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_13_26@10_04_2017/ROC.png'
set parametric
set nokey
set title 'ROC for condition pair (1,2) - Bayes error = 0.226'
set xlabel 'type I error - P(1|2)'
set ylabel 'type II error - P(2|1)'
set xrange [0:1]
set yrange [0:1]
plot '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_13_26@10_04_2017/ROC_1_2.txt' using 1:2 lt 1 with lines, 0.225946,0.225946 with points pt 7

set title 'ROC for condition pair (3,1) - Bayes error = 0.331'
set xlabel 'type I error - P(3|1)'
set ylabel 'type II error - P(1|3)'
set xrange [0:1]
set yrange [0:1]
plot '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_13_26@10_04_2017/ROC_1_3.txt' using 1:2 lt 1 with lines, 0.331019,0.331019 with points pt 7

set title 'ROC for condition pair (3,2) - Bayes error = 0.150'
set xlabel 'type I error - P(3|2)'
set ylabel 'type II error - P(2|3)'
set xrange [0:0.747924]
set yrange [0:0.747924]
plot '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_13_26@10_04_2017/ROC_2_3.txt' using 1:2 lt 1 with lines, 0.149585,0.149585 with points pt 7
