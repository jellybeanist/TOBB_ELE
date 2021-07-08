#include <iostream>

using namespace std;


class Point {
private:
	int x;
	int y;
public:
	Point();
	Point(int x, int y);  
	int getX() const;
	void setX(int x);
	int getY() const;
	void setY(int y);
   
};

class LineSegment {
	friend LineSegment operator+(const LineSegment& ls1, const LineSegment& ls2);
	friend ostream& operator<<(ostream &out, LineSegment &ls);
private:
	Point first;
	Point second;
public:
	LineSegment();
	LineSegment(int x1, int y1, int x2, int y2);
	Point getFirstPoint() const;
	void setFirstPoint(int x, int y);
	Point getSecondPoint() const;	
	void setSecondPoint(int x, int y);
//	LineSegment& operator=(LineSegment &o); Use this overloaded operator if you want to check result: LineSegment ls3=ls1+ls2; cout<<ls3<<endl;

};
