set term png enhanced size 1024,1024 lw 3 font "Times,32"
set output '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_02_20@10_04_2017/ROC.png'
set parametric
set nokey
set title 'ROC for condition pair (1,2) - Bayes error = 0.000'
set xlabel 'type I error - P(1|2)'
set ylabel 'type II error - P(2|1)'

set title 'ROC for condition pair (3,1) - Bayes error = 0.348'
set xlabel 'type I error - P(3|1)'
set ylabel 'type II error - P(1|3)'
set xrange [0:1]
set yrange [0:1]
plot '/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/roc~13_02_20@10_04_2017/ROC_1_3.txt' using 1:2 lt 1 with lines, 0.347852,0.347852 with points pt 7

set title 'ROC for condition pair (3,2) - Bayes error = 0.000'
set xlabel 'type I error - P(3|2)'
set ylabel 'type II error - P(2|3)'
