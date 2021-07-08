package burakcankarakurt328;
import java.util.*;
public class BurakCanKarakurt328{
public static void main (String [] args){
    Scanner klavye=new Scanner(System.in);
    String isim;
    int rastgele_sayi,fark,i,girilen;
    fark=0;
    girilen=0;
    rastgele_sayi=((int)(Math.random()*100)+1);
    
    System.out.println("Sayi tahmin oyunumuza hosgeldiniz.Size hitap edebilmemiz icin isminizi girer misiniz: ");
    isim=klavye.nextLine();
    System.out.println("Merhaba "+isim+"\nOyunumuz 1-100 arasinda (1 ve 100 dahil) rastgele bir tam sayi olusturacaktir ve senden bunu bulman beklenmektedir.\nOlusan sayiya yakinligin hakkinda bilgi alacaksin.\nTahmin araligini ona gore daraltabilirsin.\nToplamda 10 hakkin var.\nIyi eglenceler!");
    //System.out.println(rastgele_sayi); sayiyi dogru girince kod duzgun bir sekilde kapaniyor.
    
    int[] tahmin=new int[10];
    //kullanicinin girecegi tahmin degerlerin dizisi
    
    for (i=0;i<10;i++){
        System.out.println("Lutfen "+(i+1)+". tahmininizi giriniz:");
        tahmin[i]=klavye.nextInt();
        fark=Math.abs(tahmin[i]-rastgele_sayi);
        girilen=girilen+1;
        //System.out.println(fark); farki dogru hesapliyor.
            if(tahmin[i]==rastgele_sayi){
                System.out.println("Tebrikler "+isim+"! Dogru cevabimiz "+rastgele_sayi+" idi "+(i+1)+". denemede sayiyi dogru tahmin ettin.Programdan cikis yapiliyor.Tahminlerin: ");
                for(i=0;i<girilen;i++)
                    System.out.println((i+1)+" numaralı tahminin:"+tahmin[i]);
                        System.exit(0);}
            if(0<fark && fark<=10){
                java.awt.Toolkit.getDefaultToolkit().beep();           
                System.out.println("Yanlis tahmin. Ancak neredeyse oldu!");}
            
            if(10<fark && fark<=20){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Ancak bayagi yakin bir tahmin yaptiniz!");}
            
            if(20<fark && fark<=30){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Ancak tahmininiz uzak sayilmaz.");}
            
            if(30<fark && fark<=40){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Biraz uzak sularda yuzuyorsun.");}
            
            if(40<fark && fark<=50){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Yaklasman gerekecek bu sekilde zor bulursun :).");}
            
            if(50<fark && fark<=60){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Iyi bir insansin ama kotu bir oyuncusun"+isim+".Bunu soylemis miydim?");}
            
            if(60<fark && fark<=70){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Ya biraz daha yaklas ya da oyunu kapat!");}
            
            if(70<fark && fark<=80){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Herkes her seyi yapacak diye bir sey yok. Cok zorlamamak lazim.");}
            
            if(80<fark && fark<=90){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Alakasi bile yok...");}
            
            if(90<fark){
                java.awt.Toolkit.getDefaultToolkit().beep();
                System.out.println("Yanlis tahmin. Uctun gittin,coook uzaklardasin be"+isim+".");}
    }
    
        System.out.println("Tum haklarin doldu "+isim+". Oyunu kaybettin!");
        System.out.println("Dogru cevap: "+rastgele_sayi);
        System.out.println("Iste tahminlerin: ");
        for(i=0;i<10;i++)
            System.out.println((i+1)+" numaralı tahminin:"+tahmin[i]);
              
}
}