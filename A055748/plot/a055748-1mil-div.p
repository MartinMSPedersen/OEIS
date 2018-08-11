set xlabel "n"
set ylabel "a(n)/n"
set terminal pngcairo size 1600,1200
set output "1mil-div-A055748.png"
plot "1mil-div.dat"  using 1:2 lc rgb "black" title "1,000,000 values of a(n)/n for sequence a055748" with dots
