import java.util.ArrayList;
import java.util.Collections;

class euler30 {
	public static void main(String[] args) {
		int x = Integer.parseInt(args[0]);
		int y = Integer.parseInt(args[1]);
		int temp = 0;
	  int total = 0;
		for (int i = 2; i <= x; i++) {
			ArrayList<Integer> k = digs(i);
			temp = i;
			int sum = 0;
			for (int j : k){
				sum += Math.pow(j, y);
			}
			if (sum == temp){
				total += sum;
			}
		}
		//System.out.println(total);
	}

	public static ArrayList<Integer> digs(int n) {
		ArrayList<Integer> array = new ArrayList<>();
    while (n > 0) {
			int d = n / 10;
    	int k = n - d * 10;
    	n = d;
    	array.add(k);
    }
    Collections.reverse(array);
    return array;
	}
}
