//package netbeans_klasorum;
import java.util.*;

public class YasHesap{
	public static void main (String[] args)
	{

	int MEVCUT_YIL = 2016;
	Scanner klavye = new Scanner (System.in);

	System.out.println("Dogum yilinizi giriniz:");
	int dogum_yili= klavye.nextInt();
	// System.out.println("Dogum yiliniz:"+dogum_yili);		
	int yas = MEVCUT_YIL-dogum_yili;
	System.out.println("Yasiniz:"+yas);
	if(yas==19);
		{
		System.out.println("19 yasinda olmak ne guzel");
		}
	}
}