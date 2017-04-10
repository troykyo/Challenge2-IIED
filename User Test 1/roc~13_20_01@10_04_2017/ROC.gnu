set term png enhanced size 1024,1024 lw 3 font "Times,32"
set output '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_20_01@10_04_2017/ROC.png'
set parametric
set nokey
set title 'ROC for condition pair (1,2) - Bayes error = 0.054'
set xlabel 'type I error - P(1|2)'
set ylabel 'type II error - P(2|1)'
set xrange [0:0.267715]
set yrange [0:0.267715]
plot '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_20_01@10_04_2017/ROC_1_2.txt' using 1:2 lt 1 with lines, 0.0535431,0.0535431 with points pt 7

set title 'ROC for condition pair (3,1) - Bayes error = 0.322'
set xlabel 'type I error - P(3|1)'
set ylabel 'type II error - P(1|3)'
set xrange [0:1]
set yrange [0:1]
plot '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_20_01@10_04_2017/ROC_1_3.txt' using 1:2 lt 1 with lines, 0.322381,0.322381 with points pt 7

set title 'ROC for condition pair (3,2) - Bayes error = 0.031'
set xlabel 'type I error - P(3|2)'
set ylabel 'type II error - P(2|3)'
set xrange [0:0.155117]
set yrange [0:0.155117]
plot '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_20_01@10_04_2017/ROC_2_3.txt' using 1:2 lt 1 with lines, 0.0310233,0.0310233 with points pt 7
