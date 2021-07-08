/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4_2;
import java.util.Scanner;

public class Lab4_2 {

    public static void main(String[] args) throws InterruptedException {
        Scanner klavye=new Scanner(System.in);
        int sifre=1234;
        int durum=1;
        while(durum==1){
            System.out.print("Sifreyi giriniz:");
            String girilen=klavye.next();
            if (girilen.charAt(0)=='*'){
                String yeni_sifre=girilen.substring(1);
                sifre=Integer.parseInt(yeni_sifre);
            }
            else{
                int girilen_sifre=Integer.parseInt(girilen);
                if (girilen_sifre==sifre){
                    System.out.println("Sifre doğru!!!");
                    durum=0;
                }
                else if (girilen_sifre==-1){
                    durum=0;
                    System.out.println("Sistem kapatılıyor.");
                }
                else{
                    System.out.println("Yanlis sifre!!!");
                    System.out.println("Tekrar deneyiniz.");
                    Thread.sleep(3000);
                }
            }
        
        }
    }
    
}
