#include <iostream>
#include "Lab6Solution.h"
#define PI 3.1415926535897
using namespace std;	

Shape::Shape(){}

Shape::Shape(const Shape& base)
{
	this->centerX=base.getX();
	this->centerY=base.getY();
	this->segment=base.getSegment();
}
void Shape::enterValues(void)
{
	cout << "Enter an integer number for x coordinate of center: ";
    cin  >> centerX;
	cout << "Enter an integer number for y coordinate of center: ";
    cin  >> centerY;
	cout << "Enter an integer number for length of segment: ";
    cin  >> segment;
}

int Shape::getX(void) const
{
	return centerX;
}

int Shape::getY(void) const
{
	return centerY;
}

int Shape::getSegment(void) const
{
	return segment;
}

int Shape::getPerimeter(void)
{
	return segment;
}

void Shape::setX(int x)
{
	this->centerX = x;
}

void Shape::setY(int y)
{
	this->centerY = y;
}

//-----------------------------------------------------


Square::Square(){}

Square::Square(const Square& base)
{
	setX(base.getX());
	setY(base.getY());
	this->segment=base.getSegment();
}

int Square::getArea(void)
{
    return segment*segment;
}
int Square::getPerimeter(void)
{
	return segment*4;
}

//-------------------------------------
 
 
Rectangle::Rectangle(){}

Rectangle::Rectangle(const Rectangle& base)
{
	setX(base.getX());
	setY(base.getY());
	this->segment=base.getSegment();
	this->segment2=base.getSegment2();
}


void Rectangle::enterValues(void)
{
    Shape::enterValues();
	cout << "Enter an integer number for length of second segment: ";
    cin  >> segment2;
}
int Rectangle::getSegment2() const
{
	return segment2;
}
int Rectangle::getArea(void)
{
	return segment*segment2;
}
int Rectangle::getPerimeter(void)
{
	return (segment+segment2)*2;
}

//-------------------------

Circle::Circle(){}


Circle::Circle(const Circle& base)
{
	setX(base.getX());
	setY(base.getY());
	this->segment=base.getSegment();
}

double Circle::getArea(void)
{
    return segment*segment*PI;
}
double Circle::getPerimeter(void)
{
	return 2*segment*PI;
}
