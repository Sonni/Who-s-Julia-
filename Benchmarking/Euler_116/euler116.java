import java.math.BigInteger;

public class euler116 {
    
    public static void main(String[] args) {
        int size = Integer.parseInt(args[0]);
        int numColors = Integer.parseInt(args[1]);
        
        BigInteger result = BigInteger.valueOf(0);
        for (int i = 0; i < numColors; i++)
            result = result.add(BigInteger.valueOf(solve(2+i, size)));
        
        System.out.println(result);
        
    }
    
    private static int solve(int m, int n)
    {
        if (m > n)
            return 0;
        
        int solutions = 0;
        
        for (int i = m; i <= n; i++)
        {
            solutions++;
            solutions += solve(m, n-i);
        }
        return solutions;
    }
    
}