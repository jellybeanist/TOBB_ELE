using namespace std;
 
class Shape
{	private:
		int centerX;
		int centerY;
    protected:
        int segment;
    public:
		Shape(void);
		Shape(const Shape&);
		void setX(int);
		void setY(int);
		int getX(void) const;
		int getY(void) const;
		int getSegment(void) const;
        void enterValues(void);
		int getPerimeter(void);
};

class Square:public Shape
{
    private:

    protected:   
	
    public:
    	Square();
		Square(const Square&);
		int getArea(void); 
		
		int getPerimeter(void); 
};

class Rectangle:public Shape
{
    private:
	
    protected:   

		int segment2;
    public:
		Rectangle(void);
		Rectangle(const Rectangle&);
		int getArea(void); 	
		int getSegment2(void) const;
		int getPerimeter(void);
		void enterValues(void);
};


class Circle:public Shape
{
    private:
 
    protected:   
    
    public:
		Circle(void);
		Circle(const Circle&);
		double getArea(void);
		
		double getPerimeter(void);
};
