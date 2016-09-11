#include <iostream> 
using namespace std;

void display(int minNumber, int maxNumber, int result) 
{ 
	cout << "minNumber: " << minNumber << endl; 
	cout << "maxNumber: " << maxNumber << endl; 
	cout << "result: " << result << endl; 
}

int main() 
{ 
	int ret = 0; 
	int minNumber = 10; 
	int maxNumber = 20; 
	int result;
	result = (minNumber < maxNumber ? minNumber : maxNumber);

	display(minNumber, maxNumber, result );

	/** There is a new feature that it is allowed to be lvalue for ternary
	 * operator expression on cplusplus. When it is lvalue, it will be set to
	 * equal to right value.
	 *
	 * Note that when return a constant, it can't to be lvalue.
	 */

	(minNumber < maxNumber ? minNumber : maxNumber) = 30; 
	display(minNumber, maxNumber, result);

	return ret; 
}
