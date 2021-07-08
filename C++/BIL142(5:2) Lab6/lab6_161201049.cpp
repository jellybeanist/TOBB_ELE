//  XCode kullaniyorum.
//  Burak Can KARAKURT - 161201049
//  main.cpp
//  bil142lab6
//
//  Created by Burak Can  KARAKURT on 24.03.2021.
//  Copyright © 2021 Burak Can  KARAKURT. All rights reserved.
//

#include <iostream>

#define PI 3.1415926535897

using namespace std;

class Shape {
private:
    int xcor;
    int ycor;
protected:
    int square_side;
    int rect1;
    int rect2;
    int radius;
public:
    Shape (void);
    Shape (int& sayi1, int& sayi2);
    int getxcor(void);
    void setxcor(int &sayi);
    int getycor(void);
    void setycor(int &sayi);
    void enterValues(void);
    int getPerimeter(void);
};


class Square: public Shape {
public:
    Square(void);
    Square(int &sayi);
    int getside(void);
    void setside(int &sayi);
    int getArea(void);
};

class Rectangle: public Shape {
public:
    Rectangle(void);
    Rectangle(int &sayi1, int& sayi2);
    int getxside(void);
    void setxside(int &sayi);
    int getyside(void);
    void setyside(int &sayi);
    int getArea(void);
    
};

class Circle: public Shape {
public:
    Circle(void);
    Circle(int &sayi);
    int getrad(void);
    void setrad(int &sayi);
    int getArea(void);
};

int main()
{
    cout << "Hello world!" << endl;
    return 0;
}




Shape::Shape(void){
    xcor=0;
    ycor=0;
}

Shape::Shape (int& sayi1, int& sayi2){
    xcor=sayi1;
    ycor=sayi2;
}

int Shape::getxcor(void){
    return xcor;
}

void Shape::setxcor(int& sayi){
    xcor=sayi;
}

int Shape::getycor(void){
    return ycor;
}

void Shape::setycor(int& sayi){
    ycor=sayi;
}
void Shape::enterValues(void){
    cout<<"x and y coordinates?"<<endl;
    cin>>xcor;
    cin>>ycor;
}

int Shape::getPerimeter(void){
    if(square_side!=0)
        return 4*square_side;
    if(rect1!=0 && rect2!=0)
        return 2*(rect1+rect2);
    if(radius!=0)
        return 2*PI*radius;
}

Square::Square(void){
    square_side=0;
}

Square::Square(int& sayi){
    square_side=sayi;
}

int Square::getside(void){
    return square_side;
}

void Square::setside(int& sayi){
    square_side=sayi;
}

int Square::getArea(void){
    return square_side*square_side;
}


Rectangle::Rectangle(void){
    rect1=0;
    rect2=0;
}

Rectangle::Rectangle(int& sayi1,int& sayi2){
    rect1=sayi1;
    rect2=sayi2;
}

int Rectangle::getxside(void){
    return rect1;
}

void Rectangle::setxside(int& sayi){
    rect1=sayi;
}

int Rectangle::getyside(void){
    return rect2;
}

void Rectangle::setyside(int& sayi){
    rect2=sayi;
}

int Rectangle::getArea(void){
    return rect1*rect2;
}

Circle::Circle(void){
    radius=0;
}

Circle::Circle(int& sayi){
    radius=sayi;
}

int Circle::getrad(void){
    return radius;
}

void Circle::setrad(int& sayi){
    radius=sayi;
}

int Circle::getArea(void){
    return PI*radius*radius;
}
