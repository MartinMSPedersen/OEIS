# https://oeis.org/A181391

sapply(1:1e3,function(n){while(sum(F|1)<n)F=c(match(F[1],F[-1],0),F) 
+F[1]})
