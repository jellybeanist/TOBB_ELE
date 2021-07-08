package lab7soru3;
import java.util.*;
public class Lab7Soru3 {
    public static void main(String[] args) {
  
    Scanner klavye= new Scanner(System.in);
    int sayacpembe=0,sayacbeyaz=0,sayacmavi=0,sayacsiyah=0;
    String[] corap = new String[21];
    System.out.print("Coraplarin renkleri:");
    for(int i=0;i<21;i++){
          int sayi = (int)(Math.random()*4);
          if(sayi==0){
              sayacpembe++;
              System.out.print("P");}
              System.out.print(" ");
          if(sayi==1){
              sayacbeyaz++;
              System.out.print("B");
              System.out.print(" ");}
          if(sayi==2){
              sayacmavi++;
              System.out.print("M");
              System.out.print(" ");}
          if(sayi==3){    
              sayacsiyah++;
              System.out.print("S");
              System.out.print(" ");}
    }
          System.out.println("");
        System.out.println("Pembe corap sayisi: "+sayacpembe);
        System.out.println("Beyaz corap sayisi: "+sayacbeyaz);
        System.out.println("Mavi corap sayisi: "+sayacmavi);
        System.out.println("Siyah corap sayisi: "+sayacsiyah);
        
        int a,b,c,d;
        a = sayacpembe%2;
        b = sayacbeyaz%2;
        c = sayacmavi%2;
        d = sayacsiyah%2;
        
        if(a!=0)
        System.out.println("Pembe corap eksik!!");
        if(b!=0)
        System.out.println("Beyaz corap eksik!!");
        if(c!=0)
        System.out.println("Mavi corap eksik!!");
        if(d!=0)
        System.out.println("Siyah corap eksik!!");
    
    
    }
    
}
