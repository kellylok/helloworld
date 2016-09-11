# Linux CodingStyle

+ **缩进**  
	tab应该占8个字节，

+ **换行**  
	设置vim的C注释每行最长为80个字节

+ **空格**  
	关键字 **if, switch, case, for, do, while**后面要加一个空格
	if (condition)
	
	而**sizeof**关键字后面不需要空格，例如：s = sizeof(struct file);

	操作符`=  +  -  <  >  *  /  %  |  &  ^  <=  >=  ==  !=  ?  :`需要环绕空格，例如：if (a == b)
	
+ **命名**  
	函数命名：动词+名词，全是小写字母，多个单词用下划线  
	局部变量：名字尽量短  
	全局变量：前缀g_  
	结构体：前缀s_  
	用typedef定义的变量：后缀_t  
	
+ **typedef的注意**  
对外提供的接口，一般不使用typedef，因为它隐藏了数据的实际类型。在模块内使用的数据类型，为了节省代码，可以使用typedef
	
+ **注释**  
标准的注释：
```C
	/*
	 * content...
	 */
```  

+ **统一错误处理**  
使用goto关键字
```C
/*
 * 对于一般错误，直接返回，如果退出前需要释放资源，则封装错误处理
 */
int fun(int a)
{
        int result = 0;
        char *buffer;

        buffer = kmalloc(SIZE, GFP_KERNEL);
        if (!buffer)
                return -ENOMEM;

        if (condition1) {
                while (loop1) {
                        ...
                }
                result = 1;
                goto out_buffer;
        }
        ...
out_buffer:
        kfree(buffer);
        return result;
}
```

+ **宏定义**   
全部是大写字母，对于程序中的常量，使用宏定义或者枚举类型
	
+ **函数返回值**  
宏定义success和failure
```
#define SUCCESS 0
#define FAILURE -1
int functions(int a)
{
	if (err) {
		return FAILURE;
	}
		
	return SUCCESS;
}
```

+ **代码结构分布**  
program/  
├── include -- 头文件（对外提供的接口）  
├── Makefile  
├── lib -- 第三方的库  
└── src -- 源代码  

utils.c -- 公共的函数（与业务无关的，能集成到其他项目的）
