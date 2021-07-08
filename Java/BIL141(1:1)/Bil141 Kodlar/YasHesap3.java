// Netbeanste çalıştırıyor olsaydık burada package satırı olacaktı.
import java.util.Scanner; // Scanner sınıfı

public class YasHesap3{
    
    public static void main (String[] Args) 
    {
	int MEVCUT_YIL = 2016;
	Scanner k = new Scanner(System.in);
	System.out.println("Dogum yiliniz nedir:");
	int dogum_yili;
	dogum_yili = k.nextInt();
	System.out.println("Yasiniz "+(MEVCUT_YIL-dogum_yili));
	
	if ( (MEVCUT_YIL-dogum_yili)==19)
		System.out.print("19 yasinda");
	
	System.out.println(" olmak ne guzel!");
	
// böyle de olur	System.out.println(MEVCUT_YIL-dogum_yili+ " yasindasiniz");
	
}
}
