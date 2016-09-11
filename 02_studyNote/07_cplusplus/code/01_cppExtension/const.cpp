#include <iostream>
using namespace std;

int main()
{
	int ret;
	/**
	 * The keyword of const on c language is an imitation. Beause of we can
	 * change it by pointer.
	 */
	// c language style const, for instance:
	
	/*
	#include <stdio.h>
	int main()
	{
		int ret = 0;
		const int constNumber = 10;
		printf("The const value is: %d\n", constNumber);

		int *pNumber = (int *)&constNumber;
		*pNumber = 20;
		printf("The value has changed to: %d\n", constNumber);

		return ret;
	}
	*/

	/**
	 * However, it is really a constant on cplusplus, which is due to compiler
	 * introducing a symbol table that is consist of key and value. The compiler
	 * will allocate memory for corresponding variable, which is referencing the
	 * & symbol, but no changing the value, beause of it is a new variable.
	 */
	const int constNumber = 10;
	cout << "The const value is: " << constNumber << endl;

	int *pNumber = (int *)&constNumber;
	*pNumber = 20;
	cout << "The value has changed to: " << constNumber << endl;
	cout << "The value of pointer: " << *pNumber << endl;

	return ret;
}
