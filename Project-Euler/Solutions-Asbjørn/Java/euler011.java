
import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class euler011
{
	public static void main (String[] args)
	{
		a();
	}
	
	private static void a()
	{
                int[][] mat = new int[20][20];
                
                try (BufferedReader reader = Files.newBufferedReader(Paths.get("20xgrid.txt"))) 
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
		int matLength = 20;
		int numProd = 4;
                int prod;
                
                for (int i = 0; i < matLength; i++)
                {
                    for (int j = 0; j <= matLength - numProd; j++)
                    {
                        //Right-Left
                        prod = mat[i][j] * mat[i][j + 1] * mat[i][j + 2] * mat[i][j + 3];
                        if (prod > maxProd)
                        {
                            maxProd = prod;
                        }
                        
                        //Up-Down
                        prod = mat[j][i] * mat[j + 1][i] * mat[j + 2][i] * mat[j + 3][i];
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
                    for (int j = matLength-1; j >= numProd-1; j--)
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
                
                System.out.println(maxProd);
	}
}
