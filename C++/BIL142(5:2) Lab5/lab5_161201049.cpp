//  XCode kullaniyorum. BURAK CAN KARAKURT - 161201049
//  main.cpp
//  bil142lab5
//
//  Created by Burak Can  KARAKURT on 17.03.2021.
//  Copyright © 2021 Burak Can  KARAKURT. All rights reserved.
//

#include <iostream>
using namespace std;

int fibonacci(int number){
    if((number==1)||(number==0)){
        return(number);
    }
    else {
        return(fibonacci(number-1)+fibonacci(number-2));
    }
}


int greatestCommonDivisor(int firstNumber, int secondNumber){
    if (secondNumber!=0)
        return greatestCommonDivisor(secondNumber,firstNumber%secondNumber);
    else
        return firstNumber;
    
}


void checkPalindrome(char word[], int index, int length){
    if((length-index)==1||index==length){
        cout << "The entered word is a palindrome." << endl;
    }
    else{
        if(word[index]==word[length-1]){
            return checkPalindrome(word,index+1,length-1);
        }
        else{
            cout << "The entered word is NOT a palindrome." << endl;
        }
    }
    
}


void printSumTriangle(int A[] , int n)
{
    if (n == 0)
        return ;
    
    cout<<"[";
    for (int i = 0; i < n ; i++)
    {
        cout << A[i] ;
        if(i!=n-1)
            cout<< ",";
    }
    cout<<"]"<<endl;
    if(n!=1)
        cout<<"--> (";
    
    int array[n - 1];
    for (int i = 0; i < n - 1; i++)
    {
        int x = A[i] + A[i + 1];
        array[i] = x;
        cout<<A[i]<<"+"<<A[i+1]<<"="<<x;
        if(i!=n-2){
            cout<<",";
        }
    }
    if(n!=1)
        cout<<")"<<endl;
    
    printSumTriangle(array, n - 1);
    
}


int main() {
    //1. soru deneme
    cout<<fibonacci(6)<<endl;
    //2. soru deneme
    cout<<greatestCommonDivisor(27,6)<<endl;
    //3. soru deneme
    char word[]="atta";
    checkPalindrome(word,0,4);
    //4. soru deneme
    int A[] = {1, 2, 3, 4, 5};
    int n = sizeof(A)/sizeof(A[0]);
    printSumTriangle(A,n);
    
    return 0;
}
