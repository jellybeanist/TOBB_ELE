//  XCode kullaniyorum. Burak Can KARAKURT - 161201049
//  main.cpp
//  bil142lab4
//
//  Created by Burak Can  KARAKURT on 24.02.2021.
//  Copyright © 2021 Burak Can  KARAKURT. All rights reserved.
//

#include <iostream>
using namespace std;

int minimum(int *ary, int sz){
    int mn=*ary;
    for (int i=0;i<sz;i++){
        if(*(ary+i)<mn){
            mn=*(ary+i);
        }
    }
    return mn;
}

void swapTimes(int *xptr,int *yptr,int x){
    int *temp;
    *xptr=*xptr*x;
    *yptr=*yptr*x;
    temp=xptr;
    xptr=yptr;
    yptr=temp;
    //asagidaki 2 yazdirma islemi gerekli degil ancak mainde yazdirip kontrol etmek icin kullaniyorum.
    cout<<*xptr<<endl;
    cout<<*yptr<<endl;
}

int *doubleArray(int *ary,int sz){
    int* ary2=new int[sz*2];
    if(sz>0){
    for(int i=0;i<sz;i++){
        *(ary2+i)=*(ary+i);
    }
    for(int j=0;j<sz;j++){
        *(ary2+j+sz)=2**(ary+j);
    }
    }
    //yazdirmak icin, fonksiyona etkisi yok. cagirildigi zaman duzgun bir sekilde calisiyor. 45-47. satirlar arasi yoruma alinabilir.
    for(int p=0;p<sz*2;p++){
        cout<<ary2[p]<<endl;
    }
    return ary2;
}

int *subArray(int *ary,int start,int length){
    int *ary2=new int[length];
    if(start>=0 && length>=0){
        for(int i=0;i<length;i++){
            *(ary2+i)=*(ary+start+i);
        }
    }
    return ary2;
}




int main() {
    //1,2,3 ve 4 cevaplari icin gerekli kisimlar yorumdan kaldirilarak cevaba bakilabilir.
    
    //1)minimum kismini denemek icin yazdim, calisiyor.
    //int array[5]={34,54,2,54,87};
    //bir array olusturdum ve minimum fonksiyonunu cagirdim, sonucu dogru geldi ve 2 yazdirdi.
    //cout<<minimum(array,5)<<endl;
    
    
    //2)swapTimes'i denemek icin yazdim. Yazdirma kismini fonksiyon icinde yazdim.
    //int *xpat,*ypat;
    //int k,t;
    //k=4;
    //t=8;
    //xpat=&k;
    //ypat=&t;
    //swapTimes(xpat,ypat,3);
    
    //3) doubleArray kismini denemek icin yazdim.
    //int array[6]={34,54,2,54,88,5};
    //int *array2=doubleArray(array,6);
    //for(int i=0;i!=NULL;i++){
    //    cout<<array2[i]<<endl;
    //}
    
    
    //4)subArray kismini denemek icin yazdim, calisiyor.
    //int arraya[10]={34,54,2,54,87,4,65,245,5,2};
    //int *suba=subArray(arraya,2,4);
    //for(int i=0;i<4;i++){
    //    cout<<suba[i]<<endl;
    // }
    
}
