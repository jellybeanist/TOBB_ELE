/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab5_3_4;
import java.util.Scanner;

public class Lab5_3_4 {

    
    public static void main(String[] args) {
        Scanner klavye=new Scanner(System.in);
        System.out.print("Lutfen ücgen icin boyut giriniz: ");
        int x=klavye.nextInt();
        while(x<3){
            System.out.print("Lutfen boyut icin 2'den buyuk deger giriniz: ");
            x=klavye.nextInt();
        }
        for (int satir=1;satir<=x;satir++){
            for (int bosluk=satir;bosluk<x;bosluk++){
                System.out.print(" ");
            }
            if(satir==1)
                System.out.print("*");
            else if(satir==(x)){
                for(int i=0;i<(2*x-1);i++){
                    System.out.print("*");
                }
            }
            else{
                System.out.print("*");
                for(int j=0;j<2*(satir-1)-1;j++){
                    System.out.print(" ");
                }
                System.out.print("*");
            }
            System.out.println("");
        }
        System.out.println("");
        
    }
    
}
