import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.lang.management.*;

public class euler11
{
	public static void main (String[] args)
	{
		int matLength = Integer.parseInt(args[0]);
		int numProd = Integer.parseInt(args[1]);
		
		ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
		long tStart = threadMXBean.getCurrentThreadCpuTime();
		int[][] data = makeData(matLength);
		a(data, matLength, numProd);
		System.out.println((threadMXBean.getCurrentThreadCpuTime() - tStart)/1000000000.0);
	}
	
	private static int[][] makeData(int matLength)
	{
		int[][] mat = new int[matLength][matLength];

		try (BufferedReader reader = Files.newBufferedReader(Paths.get("mat" + matLength + ".txt")))
		{
		    int h = 0;
		    String read;
		    while((read = reader.readLine()) != null)
		    {
		        String[] words = read.split( "\\s+" );
		        int v = 0;
		        for (String s : words)
		        {
		            try
		            {
		                int i = Integer.parseInt(s);
		                mat[h][v] = i;
		            } catch (Exception e)
		            {
		                System.out.println("File is corrupt");
		            }
		            v += 1;
		        }
		        h += 1;
		    }
		    reader.close();
		} catch (IOException ex)
		{
		    System.out.println("File does not exist");
		}
		return mat;
	}

	private static long a(int[][] mat, int matLength, int numProd)
	{
		long maxProd = 0;
        long prod;
        for (int i = 0; i < matLength - numProd; i++)
        {
            for (int j = 0; j <= matLength - numProd; j++)
            {
                //Right-Left
                prod = 1;
                for (int k = 0; k < numProd; k++)
                {
                    prod *= mat[i + k][j];
                }
                if (prod > maxProd)
                {
                    maxProd = prod;
                }

                //Up-Down
                prod = 1;
                for (int k = 0; k < numProd; k++)
                {
                    prod *= mat[i][j + k];
                }
                if (prod > maxProd)
                {
                    maxProd = prod;
                }
            }
        }

        //Diagonal ->
        for (int i = 0; i <= matLength - numProd; i++)
        {
            for (int j = 0; j <= matLength - numProd; j++)
            {
                prod = 1;
                for (int k = 0; k < numProd; k++)
                {
                    prod *= mat[i + k][j + k];
                }
                if (prod > maxProd)
                {
                    maxProd = prod;
                }
            }
        }

        //Diagonal <-
        for (int i = 0; i <= matLength - numProd; i++)
        {
            for (int j = matLength - 1; j >= numProd - 1; j--)
            {
                prod = 1;
                for (int k = 0; k < numProd; k++)
                {
                    prod *= mat[i + k][j - k];
                }
                if(prod > maxProd)
                {
                    maxProd = prod;
                }
            }
        }

        return maxProd;
	}
}
