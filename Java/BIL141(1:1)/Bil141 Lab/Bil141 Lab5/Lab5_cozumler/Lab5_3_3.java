/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab5_3_3;
import java.util.Scanner;

public class Lab5_3_3 {

    public static void main(String[] args) {
        Scanner klavye=new Scanner(System.in);
        System.out.print("Lutfen ücgen icin boyut giriniz: ");
        int x=klavye.nextInt();
        while(x<3){
            System.out.print("Lutfen boyut icin 2'den buyuk deger giriniz: ");
            x=klavye.nextInt();
        }
        System.out.println("*"); // Ilk satir icin
        for (int i=0;i<(x-2);i++){
            System.out.print("*");
            for(int j=0;j<i;j++){
                System.out.print(" ");
            }
            System.out.println("*");
        }
        for(int i=0;i<x;i++){   // Son satir icin
            System.out.print("*");
        }
        System.out.println("");
    }
    
}
