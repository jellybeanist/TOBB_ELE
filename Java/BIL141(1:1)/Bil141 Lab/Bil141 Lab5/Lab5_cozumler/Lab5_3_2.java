/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab5_3_2;
import java.util.Scanner;

public class Lab5_3_2 {

    
    public static void main(String[] args) {
        Scanner klavye=new Scanner(System.in);
        System.out.print("Lutfen dikdörtgenin uzunlugunu giriniz: ");
        int x=klavye.nextInt();
        while(x<1){
            System.out.print("Lutfen uzunluk icin 0'dan buyuk deger giriniz: ");
            x=klavye.nextInt();
        }
        System.out.print("Lutfen dikdörtgenin genisligini giriniz: ");
        int y=klavye.nextInt();
        while(y<1){
            System.out.print("Lutfen genislik icin 0'dan buyuk deger giriniz: ");
            y=klavye.nextInt();
        }
        for(int i=0;i<x;i++){
            for(int j=0;j<y;j++){
                System.out.print("*");
            }
            System.out.println("");  // Alt satira geçmek icin
        }
    }
    
}
