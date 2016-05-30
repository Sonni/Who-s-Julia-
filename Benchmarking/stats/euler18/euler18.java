import java.util.*;
import java.io.*;

public class euler18
{
	public static void main(String[] args)
	{
		String file = args[0];
		try 
		(
			InputStream fis = new FileInputStream(file);
			InputStream fis2 = new FileInputStream(file);
			InputStreamReader isr = new InputStreamReader(fis);
			InputStreamReader isr2 = new InputStreamReader(fis2);
			BufferedReader br = new BufferedReader(isr);
			BufferedReader br2 = new BufferedReader(isr2);
		) 
		{
			String str;
			int lines = 0;
			while((str = br.readLine()) != null)
			{
				lines += 1;
			}
			
			ArrayList<ArrayList<Long>> rows = new ArrayList<ArrayList<Long>>();
			ArrayList<Long> temp;
			for(int i = 0; i < lines + 1; i++)
			{
				temp = new ArrayList<Long>();
				for(int j = 0; j < lines + 1; j++)
				{
					temp.add(0l);
				}
				rows.add(temp);
			}
			
			int r = 0;
			int c;
			while((str = br2.readLine()) != null)
			{
				c = 0;
				str = str.trim();
				for(String ch : str.split(" "))
				{
					rows.get(r).set(c, Long.parseLong(ch));
					c += 1;
				}
				r += 1;
			}
			
			sum(rows, lines-1);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	private static long sum(ArrayList<ArrayList<Long>> data, int row)
	{
		int c = data.size();
		for(int i = 0; i < c-1; i++)
		{
			if(data.get(row + 1).get(i) > data.get(row + 1).get(i + 1))
			{
				data.get(row).set(i, data.get(row).get(i) + data.get(row + 1).get(i));
			}
			else
			{
				data.get(row).set(i, data.get(row).get(i) + data.get(row + 1).get(i + 1));
			}
		}
		if(row == 0)
		{
			return data.get(row).get(0);
		}
		else
		{
			return sum(data, row-1);
		}
	}
}
