import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class euler011
{
	public static void main (String[] args)
	{
		a(Integer.parseInt(args[0]), Integer.parseInt(args[1]));
	}
	
	private static void a(int matsize, int seq)
	{
        int[][] mat = new int[matsize][matsize];
        
        try (BufferedReader reader = Files.newBufferedReader(Paths.get("mat" + matsize + ".txt"))) 
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

                
		int maxProd = 0;
        int prod;                
        for (int i = 0; i < matsize - seq; i++)
        {
            for (int j = 0; j <= matsize - seq; j++)
            {
                //Right-Left
                prod = 1;
                for (int k = 0; k < seq; k++)
                {
                    prod *= mat[i + k][j];
                }
                if (prod > maxProd)
                {
                    maxProd = prod;
                }
                
                //Up-Down
                prod = 1;
                for (int k = 0; k < seq; k++)
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
        for (int i = 0; i <= matsize - seq; i++)
        {
            for (int j = 0; j <= matsize - seq; j++)
            {
                prod = 1;
                for (int k = 0; k < seq; k++)
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
        for (int i = 0; i <= matsize - seq; i++)
        {
            for (int j = matsize-1; j >= seq-1; j--)
            {
                prod = 1;
                for (int k = 0; k < seq; k++)
                {
                    prod *= mat[i + k][j - k];
                }
                if(prod > maxProd)
                {
                    maxProd = prod;
                }
            }
        }
        
        System.out.println(maxProd);
	}
}
