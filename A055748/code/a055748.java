// a(1) = 1, a(2) = 1, a(n) = a(a(n-1)) + a(n - a(n-2) - 1) for n >= 3. 

import java.util.*;

public class a055748 {
    static HashMap<Integer,Integer> hmap=new HashMap<>();

    private static int a(int n) {
	int result;

	if (n==1) return 1;
	if (n==2) return 1;
	if (n==0) return 0;
	if (hmap.containsKey(n)) return hmap.get(n);
	result=a(a(n-1))+a(n-a(n-2)-1);
	if (hmap.size()<100_000_000) {
	    hmap.put(n,result);
	}
	return result;
    }

    public static void main(String[] args) {
	int record=0;
	for (int i=1; i<=100_000_000; i++) {
	    //if (i%11==0) {
	      //System.out.println(i+" "+(float)a(i)/i);
	      //System.out.println(i+" "+a(i));
	    //}
	    if (a(i)>a(i-1)) {
		if ((a(i)-a(i-1))>record) {
		    record=a(i)-a(i-1);
		    System.out.println(i+" "+a(i)+" "+record+" "+(float)(i/record));
		}
	    }
	}
    }
}


