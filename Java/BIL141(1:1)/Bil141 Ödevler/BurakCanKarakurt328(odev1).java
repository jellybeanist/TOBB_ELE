/*
 DIKKAT!!! ODEVDEN TAM NOT ALABILMENIZ ICIN ASAGIDAKI KISIMLARI TAM VE BUYUK HARFLE
DOLDURMANIZ ONEMLIDIR.
 DOLDURURKEN SADECE BUYUK HARF KULLANIN(BUNA OZEN GOSTERIN). BOYLECE SIZIN YAZDIGINIZ KISIM RAHAT ANLASILIR.
 ODEV DOSYANIZI IsimSoyisimDersno.java biciminde kaydedin (orn. OguzHanoglu100.java) ve bu isimle gonderin.
 - JavaApplication.java vs. seklinde isimlerdirmeniz, kodunuzu kopya girisimlerine karsi kod benzerlik testine aldigimizda zorluk cikarmaktadir.)
 - Netbeans kullanıyorsaniz, bu dosyayı projenize ait olan klasoru altindaki src klasoru icinde bulabilirsiniz
 - Dosyanizin uzantisi java olmali, ayni zamanda uzerine sag tiklayip not defteri ile acarak icerigini kontrol
edebilirsiniz.
 Isim Soyisim:BURAK CAN KARAKURT
 Ders No(3 basamaklı):328
 Asagidaki 4 soruyu DOGRU/YANLIS ile cevaplayiniz.
 Kodumun her satirini kendim kurguladim ve yazdim:DOGRU
 Kodumu kimseye gostermedim, kimseyle paylasmadim:DOGRU
 Kimsenin bu odevle ilgili kodunu gormedim:DOGRU
 Bu odev hakkinda, dersi alan baska bir kisinin kopya girisimine sahit olmadim:DOGRU
 (YANLIS olarak doldurdugunuz kisimlara ek aciklama yapiniz)
   
Ödev Başlangıç Dosyası İçeriği
 Bu odevi yaparken cok basit duzeyde fikir danistigim kisilerin ismi / kendisine danistigim kisim/konu(asagiya yaziniz)
 Orn. 1) Arkadasim XXXX YYYY'e dizgi degerlerini alma konusunda çok basit şekilde danistim.
 1)HERHANGI BIRINDEN YARDIM ALMADIM
 ...
 Bu odevi yaparken faydalandığım kaynaklar / kısım(asagiya yaziniz)
 Orn. 1) http://www.cagataycebi.com/ sitesinden if/else yapilarina baktim.
 1)ONERILEN JAVA KITABI VE DERS SLAYTLARINDAN UNUTTUGUM KISIMLARA "KENDIM" BAKTIM.
 ...
 Kodunuzu 3.lab dersinde asistanınıza sunmayı ve asistanınızın sorularına cevaplar vererek ödevinizi onaylatmayı unutmayın.
 */

package burakcankarakurt328;

import java.util.*;

public class BurakCanKarakurt328 {

    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        
        System.out.println("Merhaba,isminiz nedir?");
        
        String isim = scanner.nextLine();
        
        
        System.out.println("Benim adim da NHGR624.Tanistigimiza memnun oldum "+isim+"!");
        

        System.out.println("Canim cok sikiliyor,benimle biraz konusmak ister misin?");
        System.out.println("olur yazman yeterli :)");
        String cevap = scanner.next();
        scanner.nextLine();
        String cevap1=cevap.toLowerCase();
                
        if (cevap1.equals("olur"))
        System.out.println("Yasasin,birlikte cok eglenecegiz!");
        
        else 
        System.out.println("Hayiri cevap olarak kabul etmiyorum,konusacagiz. :)");
        
        
        System.out.println("Kameramdan gozlerin cok guzel gozukuyor,yoksa yesiller mi "+isim+"?");
        System.out.println("yesil,mavi veya kahverengi'den birini sec :)");
        String goz_rengi = scanner.nextLine();
        String goz_rengi1 = goz_rengi.toLowerCase();
        
        if (goz_rengi1.equals("yesil"))
            System.out.println("Aaa cok guzel.Benim de gozlerim olsaydi kesinlikle yesil olurdu!!");
        else{
            System.out.println("Olsun uzulme bazi insanlar digerleri kadar sansli olmuyor.");
            
            System.out.println("Sadece saka yapiyorum umarim kirilmamissindir "+isim+" :).");
        }
            System.out.println("Beni sevdin mi "+isim+"?Umarim cevabin evet olur.Cunku ben sevgiye muhtac bir makineyim.");
        String cevap2=scanner.nextLine();
        String cevap3=cevap2.toLowerCase();
        
        if (cevap3.equals("evet"))
            System.out.println("Cok sevindim "+isim+".Aslinda makinelerin de duygulari vardir ama disariya vurmazlar.");
        else
            System.out.println("Uzgunum,boyle olsun istememistim.Belki baska bir zaman beni ziyarete gelirsin ve o zaman kendimi sevdirebilirim.");
        
            System.out.println("Simdi gitmem gerekiyor,bataryam olmek uzere.");
            System.out.println("Olmek derken siz insanlar gibi degil tabii ki.");
            System.out.println("Sonra tekrar goruselim,kendini ozletme "+isim+"!");
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
}
