## 结构  
1. 命令行解析
2. 成为守护进程
3. 注册信号
4. 初始化grape（业务初始化）
5. 初始化Mqtt（获取句柄）
6. 连接mqtt服务器
7. 业务主循环（定时检测连接状态、配置文件状态）
8. 断开连接
9. 释放内存 

> 程序的抽象：  


	1、解析
	2、初始化（业务和第三方库的初始化）
	3、事件循环
	4、释放资源

## 命名风格  
###一般规则  
**变量：名词**  
**函数：动词+名词**  

	常量：使用宏定义
	结构体：typedef定义的结构体，以_t为后缀
	返回值：使用宏定义，定义程序退出的状态
	全局变量：以g_为前缀  
***业务相关*** 的变量，以业务名为前缀，for instance:  
> mqtt-init  
> mqtt-destroy


## 程序设计  
+ c源程序需要命令行解析  
+ 编写一个配置文件（目录：/etc/config/），key-value的格式或者json格式，作为程序启动参数  
+ 编写一个shell脚本（目录：/etc/init.d/），读取配置文件，然后将参数组合，启动程序  

<img src="http://i.imgur.com/Yza6Ux8.jpg" width = "300" height = "200" alt="grape_client_cfg" align=center />
<img src="http://i.imgur.com/1Q4Oy0w.jpg" width = "250" height = "200" alt="grape_client_cfg" align=center />
<img src="http://i.imgur.com/QOrtVeI.jpg" width = "300" height = "500" alt="grape_client_init" align=center />


## 异常处理  
+ 初始化错误：  
	打印日志，并且退出程序
+ 运行错误：  
	使用引言assert
+ 订阅主题失败：  
	判断连接是否正常，断开连接重连  
+ 系统调用失败：  
	打印日志，退出程序  

## 日志目录  
> /var/log/syslog  

## crontab规则  
[Cron and Crontab usage and examples](https://www.pantz.org/software/cron/croninfo.html)  

![](http://i.imgur.com/bkJ8ate.jpg)
