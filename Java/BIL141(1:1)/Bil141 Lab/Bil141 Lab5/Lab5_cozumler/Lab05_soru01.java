/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab05;

import java.util.Scanner;

/**
 *
 * @author admin
 */
public class Lab05_soru01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner k=new Scanner(System.in);
        System.out.print("Lütfen isim ve soyisminizi giriniz: ");
        String isim = k.nextLine();
        for(int i=0;i<isim.length();i++)
            System.out.println(isim.charAt(i));
    }
    
}
