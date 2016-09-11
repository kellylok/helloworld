#include <iostream>
#include <string.h>
using namespace std;

namespace NameSpaceA
{
	int a = 10;
}

namespace NameSpaceB
{
	int a = 1;
	namespace NameSpaceC
	{
		struct Teacher
		{
			int age;
			char name[1024];
		};
	}
}

int main()
{
	using namespace NameSpaceA;
	// using namespace NameSpaceB;
	using namespace NameSpaceB::NameSpaceC;

	cout << a << endl;
	cout << NameSpaceB::a << endl;

	Teacher t1 = {20, "kelly"};
	cout << t1.name << "\t" << t1.age << endl;
}
