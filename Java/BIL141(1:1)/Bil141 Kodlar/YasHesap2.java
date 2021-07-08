// package netbeans_klasorum;
import java.util.Scanner;
// şöyle de olurdu: import java.util.*;

public class YasHesap2{
	public static void main (String[] args)
	{
	int MEVCUT_YIL;
	MEVCUT_YIL= 2016;
	// ya da int MEVCUT_YIL= 2016;
	System.out.println("Dogum yilinizi giriniz:");
	Scanner k = new Scanner(System.in);
	int dogum_yili = k.nextInt();
	
	System.out.println("Yasiniz "+(MEVCUT_YIL-dogum_yili));
	}

}
