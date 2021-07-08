package lab7soru2;
import java.util.*;
public class Lab7Soru2 {

    public static void main(String[] args) {
       Scanner klavye=new Scanner(System.in);
       System.out.println("Lutfen dizi uzunlugunu giriniz: ");
       int N=klavye.nextInt();
       
       double[] rastgelesayi= new double[N];
       
       for(int i=0;i<N;i++)
       rastgelesayi[i]=((Math.random()*90)+10);
       //System.out.println(rastgelesayi[i]);}
              
    double temp;
    
    int n = rastgelesayi.length;
    
    boolean degisim;
    
       do{
        degisim = false;

    for(int i=0; i<N-1 ; i++){
            if(rastgelesayi[i] > rastgelesayi[i+1]){
                temp = rastgelesayi[i];
                rastgelesayi[i] = rastgelesayi[i+1];
                rastgelesayi[i+1] = temp;
                degisim = true;
            }
        }

        n--;
          
    }while(degisim);
    System.out.println("Dizinin son hali: ");
         for(int i=0; i<N; i++)
        {
            System.out.println(rastgelesayi[i]+" ");
        }   
        
       
       
       
       
       
       
       
    }
    
}
