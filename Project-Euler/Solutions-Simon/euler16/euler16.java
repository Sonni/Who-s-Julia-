
public class euler16 {
  public static void main (String[] args) {
      int num = Integer.parseInt(args[0]);
      int power = Integer.parseInt(args[1]);

      int[] arr = new int[400];
      arr[0] = 2;
      int carry = 0;
      int sum = 0;

      for (int i = 1; i < 1000; i++) {
        for (int j = 0; j < arr.length; j++) {
          int temp = arr[j] * 2;
          if (temp > 9) {
            arr[j] = temp % 10 + carry;
            carry = 1;
          }
          else {
            arr[j] = temp + carry;
            carry = 0;
          }
        }
      }
      for (int i = 0; i < arr.length; i++) {
        sum += arr[i];
        System.out.print(arr[i]);
      }
      System.out.println("\n" + sum);
  }
}

