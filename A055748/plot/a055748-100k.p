set xlabel "n"
set ylabel "a(n)"
set terminal pngcairo size 1600,1200
set output "100k-A055748.png"
plot "100k.dat"  using 1:2 lc rgb "black" title "100,000 values of a(n) for sequence a055748" with dots
