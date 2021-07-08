package lab7soru1;
import java.util.*;
public class Lab7Soru1 {

    public static void main(String[] args) {
       System.out.println("Lutfen dizi uzunlugu giriniz:" );
       Scanner klavye=new Scanner(System.in); 
       int N=klavye.nextInt();
       int[] teksayi= new int[N];
       for(int i=0;i<N;i++){
          teksayi[i]=(2*i+1);
          System.out.println(teksayi[i]);
           
           
    }
    
}
}