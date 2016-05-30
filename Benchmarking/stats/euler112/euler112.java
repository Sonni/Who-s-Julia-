public class euler112
{
	public static void main(String[] args)
	{
		float prop = Float.parseFloat(args[0]);
		calc(prop);
	}
	
	private static boolean kind(int n)
	{
		String s = String.valueOf(n);
		int l = s.length();
		int i = 0;
		int j = i + 1;
		boolean decr = false;
		boolean bouncy = false;
		boolean incr = false;
		while(j < l)
		{
			int a = Character.getNumericValue(s.charAt(i));
			int b = Character.getNumericValue(s.charAt(j));
			if(a > b)
			{
				decr = true;
			}
			else if(a < b)
			{
				incr = true;
			}
			i += 1;
			j += 1;
		}
		if(decr && incr)
		{
			return true;
		}
		return false;
	}
	
	private static int calc(float prop)
	{
		int currentProp = 0;
		int i = 100;
		int countBouncy = 0;
		while(currentProp < prop)
		{
			if(kind(i))
			{
				countBouncy += 1;
			}
			currentProp = (countBouncy * 100) / i;
			if(currentProp >= prop)
			{
				return i;
			}
			i += 1;
		}
		return 0;
	}
}
