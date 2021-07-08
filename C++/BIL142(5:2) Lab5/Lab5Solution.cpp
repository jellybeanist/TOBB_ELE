#include <iostream>

using namespace std;

int fibonacci(int number)
{
	if (number == 1 || number == 2)
		return 1;
	else
		return (fibonacci(number - 1) + fibonacci(number - 2));
}

int greatestCommonDivisor(int firstNumber, int secondNumber)
{
	if (firstNumber == 1 || secondNumber == 1)
	{
		return 1;// To prevent meaningless recursion
	}
	else if (firstNumber == secondNumber)
		return firstNumber;
	else if (firstNumber < secondNumber)
		return greatestCommonDivisor(firstNumber, (secondNumber - firstNumber));
	else
		return greatestCommonDivisor(secondNumber, (firstNumber - secondNumber));
}

void checkPalindrome(char word[], int index, int length)
{
	int len = length - (index + 1);
	if (word[index] == word[len])
	{
		if (index + 1 == len || index == len)
		{
			cout<<" The entered word is a palindrome.\n\n";
		}
		else
			checkPalindrome(word, index + 1, length);
	}
    else
		cout<<" The entered word is not a palindrome.\n\n";
}

void printSumTriangle(int A[] , int n)
{
	if (n < 1)
		return;
	
    cout << "[";       
	for (int i = 0; i < n ; i++)
	{
		if(i == n - 1)
			cout << A[i] << "]"<< endl;
		else
			cout << A[i] << ", ";
	}              
  
	int temp[n - 1];
	for (int i = 0; i < n - 1; i++)
	{
		int x = A[i] + A[i + 1];
		temp[i] = x;
	}

	printSumTriangle(temp, n - 1);

}

 