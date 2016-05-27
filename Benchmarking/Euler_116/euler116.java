public class euler116 {
    
    public static void main(String[] args) {
        int size = Integer.parseInt(args[0]);
        int numColors = Integer.parseInt(args[1]);
        
        long result = 0l;
        for (int i = 0; i < numColors; i++)
            result += solve(2+i, size);
        
    }
    
    private static long solve(int m, int n)
    {
        if (m > n)
            return 0l;
        
        long solutions = 0l;
        
        for (int i = m; i <= n; i++)
        {
            solutions++;
            solutions += solve(m, n-i);
        }
        return solutions;
    }
    
}