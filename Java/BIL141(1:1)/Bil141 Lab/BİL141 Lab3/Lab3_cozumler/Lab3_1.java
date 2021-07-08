
package lab3_1;
import java.util.Scanner;

public class Lab3_1 {

    public static void main(String[] args) {
        Scanner klavye =new Scanner(System.in);
        System.out.print("Lutfen urunun etiket fiyatini giriniz: ");
        double fiyat=klavye.nextDouble();
        System.out.print("Lutfen odeme secenegini giriniz(Nakit icin 'n'-Taksit icin 't'): ");
        String odeme_turu=klavye.next();
        if(odeme_turu.equals("n")){
            System.out.println("Urunun yeni fiyati: "+ (0.8*fiyat));
        }
        else{
            System.out.print("Lutfen taksit sayisini giriniz: ");
            int taksit_sayisi=klavye.nextInt();
            if(taksit_sayisi<=6){
                System.out.println("Urunun yeni fiyati: "+ fiyat);
                System.out.println("Aylik taksit tutari: "+(fiyat/taksit_sayisi));
            }
            else if(taksit_sayisi<=12){
                System.out.println("Urunun yeni fiyati: "+ (1.1*fiyat));
                System.out.println("Aylik taksit tutari: "+((1.1*fiyat)/taksit_sayisi));
            }
            else{
                System.out.println("Urunun yeni fiyati: "+ (1.2*fiyat));
                System.out.println("Aylik taksit tutari: "+((1.2*fiyat)/taksit_sayisi));
            }        
        }       
    }    
}
