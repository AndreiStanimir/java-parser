public class ClasaTest{

    private static int number1234 = 1234;

    /*test
    test

    */
    
    //This is a function that returns true if a number is prime

    public static boolean isPrime(int n)
    {
        int i;
        for (int i = 2; i < n; i++)
        {
            if (n % i == 0)
            {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args)
    {
        int number = 17;
        boolean x = isPrime(number);
        boolean y = isPrime(1234);
        String stringTest = "Test";

        if (x == true)
        {
            System.out.println("17 is Prime");
        }

        if (number > 5)
        {
            number = number + 4;
            number1234 = number1234 + number;
            System.out.println(stringTest);
        }
    }

    public int getNumber() {
        return number1234;
    }
}
