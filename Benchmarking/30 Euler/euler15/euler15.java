import java.util.*;

public class euler15
{
	public static void main(String[] args)
	{
		int gridSize = Integer.parseInt(args[0]);
		ArrayList<ArrayList<Long>> grid = new ArrayList<ArrayList<Long>>();
		ArrayList<Long> temp;
		for(int i = 0; i < gridSize + 1; i++)
		{
			temp = new ArrayList<Long>();
			for(int j = 0; j < gridSize + 1; j++)
			{
				temp.add(1l);
			}
			grid.add(temp);
		}
		calc(grid, gridSize);
	}
	
	private static long calc(ArrayList<ArrayList<Long>> grid, int gridSize)
	{
		for(int i = gridSize-1; i >= 0; i--)
		{
			for(int j = gridSize-1; j >= 0; j--)
			{
				grid.get(i).set(j, grid.get(i + 1).get(j) + grid.get(i).get(j + 1));
			}
		}
		return grid.get(0).get(0);
	}
}
