/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab01_cozumleri;

import java.util.Scanner;
//import java.lang.Math;

/**
 *
 * @author İhsan
 */
public class Lab01_cozumleri {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*
        ***********************************************************************
        ---------------        BİL 141 LAB I Çözümleri          ---------------
        ***********************************************************************
        
        ***********************************************************************
        +++++   SORU-1      ++++++
        */
        // 1.a kısmı
        System.out.print("Merhaba. \nİsminiz: ");
        Scanner klavye = new Scanner(System.in);
        String isim = klavye.next();
        System.out.println("Hoşgeldin "+isim);
        
        // 1.b kısmı
        System.out.print("Doğum yılınız: ");
        int dogum = klavye.nextInt();
        System.out.println("Yaşınız: "+(2016-dogum));
        
        // 1.c kısmı
        System.out.print("Annenizin kızlık soyadını yazınız: ");
        String anneKizlik = klavye.next();
        char c1 = anneKizlik.charAt(0); // -> ilk karakter alma
        char c3 = anneKizlik.charAt(2); // -> üçüncü karakter alma
        System.out.println("3. ve 1. harfler: "+c3+c1);
        
        // 1.d kısmı
        System.out.println("Sizin için oluşturulan şifre: " +c3+isim+(2016-dogum));
        
        
        
        /*        
        ***********************************************************************
        +++++   SORU-2      ++++++
        */
        double a,b,c,d;
        Scanner m = new Scanner(System.in);
        System.out.print("a katsayısını giriniz : ");
        a = m.nextDouble();
        
        System.out.print("b katsayısını giriniz : ");
        b = m.nextDouble();
                
        System.out.print("c katsayısını giriniz : ");
        c = m.nextDouble();
        
        System.out.print("d katsayısını giriniz : ");
        d = m.nextDouble();
        
        System.out.println("Girilen katsayılar ile oluşan f(x) = " + a + "x^3 + " + b + "sin(2*pi*" + b + "*x) + " + c + "e^-(x-" + c*c + ") + " + d/5.0 +  " şeklindedir.");
        
        System.out.print("Hangi x değerinde f(x) hesaplansın? ");
        double x = m.nextDouble();
        double fx = a*Math.pow(x, 3)+ b*Math.sin(2*Math.PI*b*x)+c*Math.pow(Math.E,-(x-Math.pow(c, 2)) ) + d/5.0;
        
        System.out.println("f(" + x + ")=" + fx);
        
        /*
        ***********************************************************************
        +++++   SORU-3      ++++++
        */
        
        Scanner s = new Scanner(System.in);
        System.out.println("1.Nokta için girişler yapılacaktır...");
        
        System.out.print("x : ");
        double x1 = s.nextDouble();
        System.out.print("y : ");
        double y1 = s.nextDouble();
        System.out.print("z : ");
        double z1 = s.nextDouble();
        
        System.out.println("2.Nokta için girişler yapılacaktır...");
        
        System.out.print("x : ");
        double x2 = s.nextDouble();
        System.out.print("y : ");
        double y2 = s.nextDouble();
        System.out.print("z : ");
        double z2 = s.nextDouble();
        
        System.out.println("3.Nokta için girişler yapılacaktır...");
        
        System.out.print("x : ");
        double x3 = s.nextDouble();
        System.out.print("y : ");
        double y3 = s.nextDouble();
        System.out.print("z : ");
        double z3 = s.nextDouble();
        
        // Uzunluk hesaplama
        double AB = Math.sqrt(Math.pow((x1-x2),2)+Math.pow((y1-y2),2)+Math.pow((z1-z2),2));
        double AC = Math.sqrt(Math.pow((x1-x3),2)+Math.pow((y1-y3),2)+Math.pow((z1-z3),2));
        double BC = Math.sqrt(Math.pow((x3-x2),2)+Math.pow((y3-y2),2)+Math.pow((z3-z2),2));
        
        System.out.println("("+x1+","+y1+","+z1+") ile ("+x2+","+y2+","+z2+ ") arası uzunluk : "+AB);
        System.out.println("("+x1+","+y1+","+z1+") ile ("+x3+","+y3+","+z3+ ") arası uzunluk : "+AC);
        System.out.println("("+x2+","+y2+","+z2+") ile ("+x3+","+y3+","+z3+ ") arası uzunluk : "+BC);
        
        // BONUS :  AĞIRLIK MERKEZİ HESAPLAMA:
        double x0 = (x1+x2+x3)/3.0;
        double y0 = (y1+y2+y3)/3.0;
        double z0 = (z1+z2+z3)/3.0;
        System.out.println("Ağırlık merkezinin karşılık geldiği noktalar: ("+x0+","+y0+","+z0+")");
        
        /*
        ***********************************************************************
        +++++   SORU-4      ++++++
        */
        System.out.print("Merhaba. \nİsminiz: ");
        String isim2 = klavye.next();
        System.out.print("Soyisminiz: ");
        String soyisim2 = klavye.next();
        System.out.print("Doğum yılınız: ");
        int dogumYil2 = klavye.nextInt();
        System.out.print("Doğum ayınız: ");
        int dogumAy2 = klavye.nextInt();
        System.out.print("Doğum gününüz: ");
        int dogumGun2 = klavye.nextInt();
        int gun=14, ay=10, yıl=2016;
        int bugunToplam = yıl*365+ay*30+gun;
        int dogumToplam = dogumYil2*365+dogumAy2*30+dogumGun2;
        int fark = bugunToplam-dogumToplam;
        int yasYil,yasAy,yasGun;
        yasYil = fark/365;
        yasAy = (fark-yasYil*365)/30;
        yasGun = (fark-yasYil*365)%30;
        System.out.println("Merhaba "+isim2+". Girdiğin bilgilere göre yaşın "+yasYil+" yıl,"+yasAy+" ay ve "+yasGun+" gündür.");
        // BONUS
        System.out.println("\"Merhaba "+isim2+". Girdiğin bilgilere göre yaşın "+yasYil+" yıl,"+yasAy+" ay ve "+yasGun+" gündür.\"");
        
    }
    
}
