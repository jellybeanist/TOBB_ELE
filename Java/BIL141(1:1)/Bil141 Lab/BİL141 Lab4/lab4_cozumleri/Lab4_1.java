/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4_1;
import java.util.Scanner;

public class Lab4_1 {

    public static void main(String[] args){
        Scanner klavye=new Scanner(System.in);
        System.out.print("Lutfen 100 ile 10000000 bir sayı giriniz: ");
        int x=klavye.nextInt();

        while(x<100||x>10000000){
            System.out.println("Yanlis deger girdiniz.");
            System.out.print("Lutfen 100 ile 10000000 bir sayı giriniz: ");
            x=klavye.nextInt();
        }
        
        int ters_x=0;
        int kalan=x;
        while(kalan!=0){
            ters_x*=10;
            ters_x+=kalan%10;
            kalan=kalan/10;
        }
        System.out.println("Girilen sayi: "+x);
        System.out.println("Girilen sayinin tersi: "+ters_x);
        System.out.println("Oran: "+(((double)ters_x)/x));
       
    }
    
}
