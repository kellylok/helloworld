#include <iostream>
using namespace std;

/**
 * strengthen strcut type
 * struct is a new type for cplusplus, which is not for c language.
 */

/**
 * This is incorrect usage of struct in c language. Because of struct isn't a
 * data type in c language.
 */
/*
#include <stdio.h>
struct _teacher
{
	int age;
	char name[1024];
};

int main()
{
	int ret = 0;
	_teacher t1 = { 20, "kelly" };

	printf("%s\t%d\n", t1.name, t1.age);

	return ret;
}
*/

/**
 * This is valid for c++ to use.
 */
struct Teacher
{
	int age;
	char name[1024];
};

int main()
{
	int ret = 0;
	Teacher t1 = { 20, "kelly" };

	cout << t1.name << "\t" << t1.age << endl;

	return ret;
}
