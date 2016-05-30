import java.util.*;
import java.io.*;

public class euler13
{
	public static void main(String[] args)
	{
		String data = args[0];
		calc(makeData(data));
	}

	private static ArrayList<ArrayList<Integer>> makeData(String data)
	{
		try
		(
			InputStream fis = new FileInputStream(data);
			InputStreamReader isr = new InputStreamReader(fis);
			BufferedReader br = new BufferedReader(isr);
		)
		{

			ArrayList<ArrayList<Integer>> mat = new ArrayList<ArrayList<Integer>>();
			String str;
			ArrayList<Integer> temp;
			while((str = br.readLine()) != null)
			{
				str = str.trim();
				temp = new ArrayList<>();
				for(String ch : str.split(""))
				{
					temp.add(Integer.parseInt(ch));
				}
				mat.add(temp);
			}
			return mat;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return null;
	}

	private static String calc(ArrayList<ArrayList<Integer>> mat)
	{
		int r = mat.size();
		int c = mat.get(0).size();
		ArrayList<Integer> temp = new ArrayList<>();
		int sum;
		for(int col = c-1; col >= 0; col--)
		{
			sum = 0;
			for(int row = r-1; row >= 0; row--)
			{
				sum += mat.get(row).get(col);
			}
			temp.add(sum);
		}
		int i = 0;
		int k;
		int n;
		while(true)
		{
			if(i < c-1)
			{
				k = temp.get(i) % 10;
				n = (temp.get(i) - k) / 10;
				temp.set(i, k);
				temp.set(i+1, temp.get(i + 1) + n);
			}
			else
			{
				k = temp.get(i) % 10;
				n = (temp.get(i) - k) / 10;
				temp.set(i, k);
				temp.add(n);
			}
			if(temp.get(temp.size()-1) < 10)
			{
				break;
			}
			i += 1;
		}
		String result = "";
		for(i = 0; i < 10; i++)
		{
			result = result + temp.get(temp.size()-(1+i));
		}
		return result;
	}
}
