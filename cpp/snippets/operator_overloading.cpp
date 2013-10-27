#include <iostream>

using namespace std;

class point{
public:
	point(double x=0, double y=0):_x(x),_y(y){}

	double get_x() {
		return _x;
	}

	void set_x(double x) {
		_x = x;
	}

	double get_y() {
		return _y;
	}

	void set_y(double y) {
		_y = y;
	}

private:
	double _x, _y;
};

int main(int argc, char* argv[]) {

	point my_point;
	std::cout << "X:" << my_point.get_x() << " Y:" << my_point.get_y() << std::endl;
	
}