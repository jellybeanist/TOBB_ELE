#include "Lab3Solution.h"

using namespace std;

Point::Point() : x(0), y(0) { }

Point::Point(int x, int y) : x(x), y(y) { } 
 
int Point::getX() const{
   return x;
}

void Point::setX(int x) {
   this->x = x;
}

int Point::getY() const{
   return y;
}

void Point::setY(int y) {
   this->y = y;
}

LineSegment::LineSegment() : first(0,0), second(0,0) { }

LineSegment::LineSegment(int x1, int y1, int x2, int y2) : first(x1,y1), second(x2,y2) { }

Point LineSegment::getFirstPoint() const{
	return first;
}

void LineSegment::setFirstPoint(int x, int y){
	first.setX(x);
	first.setY(y);
}

Point LineSegment::getSecondPoint() const{
	return second;
}	

void LineSegment::setSecondPoint(int x, int y){
	second.setX(x);
	second.setY(y);
}

ostream& operator<<(ostream &out, LineSegment &ls) {
	out << "(" << ls.getFirstPoint().getX() << ", " << ls.getFirstPoint().getY() << ")" << "--" << "(" << ls.getSecondPoint().getX() << ", " << ls.getSecondPoint().getY() << ")";
	return out;
}




LineSegment operator+(const LineSegment& ls1, const LineSegment& ls2)
{ 
	LineSegment ls3;
	int x1,y1,x2,y2;
	x1 = ls1.getFirstPoint().getX() + ls2.getFirstPoint().getX();
	y1 = ls1.getFirstPoint().getY() + ls2.getFirstPoint().getY();
	x2 = ls1.getSecondPoint().getX() + ls2.getSecondPoint().getX();
	y2 = ls1.getSecondPoint().getY() + ls2.getSecondPoint().getY();
	
	ls3.setFirstPoint(x1,y1);
	ls3.setSecondPoint(x2,y2);
	return ls3;
}
/*
Use this overloaded operator if you want to check result: LineSegment ls3=ls1+ls2; cout<<ls3<<endl;

LineSegment& LineSegment::operator=(LineSegment &ls) {
	this->setFirstPoint(ls.getFirstPoint().getX() , ls.getFirstPoint().getY());
	this->setSecondPoint(ls.getSecondPoint().getX() , ls.getSecondPoint().getY());
	return *this;
};
*/


