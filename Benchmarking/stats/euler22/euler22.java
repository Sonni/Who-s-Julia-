import java.util.*;
import java.io.*;

public class euler22
{
	public static void main(String[] args)
	{
		String file = args[0];
		try
		(
			InputStream fis = new FileInputStream(file);
			InputStreamReader isr = new InputStreamReader(fis);
			BufferedReader br = new BufferedReader(isr);
		)
		{
			String line = br.readLine();
			br.close();
			isr.close();
			fis.close();
			calc(letterValues(), namesSorted(line));
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	private static ArrayList<String> namesSorted(String line)
	{
		String line_new = line.replace((char) 22, (char) 0);
		ArrayList<String> array = new ArrayList<String>(Arrays.asList(line_new.split(",")));
		Collections.sort(array);
		return array;
	}

	private static HashMap<String, Integer> letterValues()
	{
		String[] letters = new String[]{"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
		HashMap<String, Integer> mapo = new HashMap<>();
		int valueLetter = 1;
		for(String s : letters)
		{
			mapo.put(s, valueLetter);
			//valueLetter += 1;
		}
		return mapo;
	}

	private static int calc(HashMap<String, Integer> mapo, ArrayList<String> names_sorted)
	{
		int value = 0;
		int mapo_index = 1;
		for(String word : names_sorted)
		{
			int value_word = 0;
			for(String ch : word.split(""))
			{
				value_word += mapo.getOrDefault(ch, 0);
			}
			value += value_word * mapo_index;
			mapo_index += 1;
		}
		return value;
	}
}
