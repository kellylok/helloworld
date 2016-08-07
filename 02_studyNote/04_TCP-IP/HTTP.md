# 介绍

我们每天打开浏览器访问新闻网站，或者其他web页面，大多数都是`http`协议。在浏览器地址栏输入以`http://`开始的网址，  
使用的就是`http`协议。`http`协议是web应用程序的核心，学习`http`有助于我们了解地址栏的内容代表的是什么，并且可以  
了解web应用程序是怎么工作的。同时，这也是web开发者的基本功。

# 背景

## 概述
我们在浏览器的地址栏输入一个要访问的URL，浏览器给我们呈现整个网站。如果我们点击一个链接，或者提交一份表，则会跳
转都下一个页面或者返回一个错误码。在这个过程，涉及文件和数据的传输，浏览器隐藏了细节，呈现给我们的结果的可视化
的页面。而传输则需要制定一些规则，相当于人与人之间通过语言来交流一样，只是这里的对象是客户端和服务器。这些规则，
称为**HTTP传输协议**。`HTTP`需要客户端向服务器发出请求，然后等待服务器的响应。因此，它又简称为请求/响应协议，即
一问一答的通信模式。  

## 网络是如何工作的
Internet由成千上万的相互连接的网络组成，这些相互连接的设备可以相互通信。这时，要求所有的设备需要有唯一的标识，好
比我们的手机号码，每个人的号码不允许相同，获取对方的电话号码则可以拨打过去。相对应网络，我们把这唯一的标识称为IP
地址，每个IP地址可以有多个端号，不同的端号对应着设备上的服务。  
IP地址表示为：``192.168.0.1``  
带端号的IP地址表示为：``192.168.0.1:1234``
但是，为什么我们一般都不使用IP作为URL，因为数字不易记忆，这样做不科学。因此，出现了DNS——Domain Naming System，域
名解析系统。它的出现，使得我们访问网站变得简单，比如github官网，我们在地址栏输入`https://github.com`就OK。虽然我
们输入`https://192.30.253.113`也同样能进入github官网，但相比之下，域名更加对人类友好，便于记忆。DNS的工作就是将
域名映射成IP地址。

## 客户端和服务器
我们日常所使用的web浏览器是常用的客户端，例如：IE、火狐、谷歌浏览器等待。Web浏览器负责处理HTTP请求和响应，但Web浏
览器不是唯一的客户端，其他能处理HTTP请求的应用程序，都可以作为客户端。客户端请求的内容所在的计算机则成为服务器。。
服务器的工作是响应客户端的请求，通常返回请求所指的的相应数据。

## 资源
资源是通用的术语，它包括图片、视频、音频和文件，它不限于文件和web网页，软件或网页游戏也是资源，网络上一切东西都可
以称为资源。

## 无状态
`HTTP`是一个属于应用层的面向对象的协议，`HTTP`协议一共有五大特点：  
 1. 支持客户/服务器模式；
 2. 简单快速；
 3. 灵活；
 4. 无连接；
 5. 无状态。

**无连接**  
A protocol is said to be stateless when it's designed in such a way that each request/response pair is completely independent of the previous one. It is important to be aware of HTTP as a stateless protocol and the impact it has on server resources and ease of use. In the context of HTTP, it means that the server does not need to hang on to information, or state, between requests. As a result, when a request breaks en route to the server, no part of the system has to do any cleanup. Both these reasons make HTTP a resilient protocol, as well as a difficult protocol for building stateful applications. Since HTTP, the protocol of the internet, is inherently stateless that means web developers have to work hard to simulate a stateful experience in web applications.

When you go to Facebook, for example, and log in, you expect to see the internal Facebook page. That was one complete request/response cycle. You then click on the picture -- another request/response cycle -- but you do not expect to be logged out after that action. If HTTP is stateless, how did the application maintain state and remember that you already input your username and password? In fact, if HTTP is stateless, how does Facebook even know this request came from you, and how does it differentiate data from you vs. any other user? There are tricks web developers and frameworks employ to make it seem like the application is stateful, but those tricks are beyond the scope of this book. The key concept to remember is that even though you may feel the application is stateful, underneath the hood, the web is built on HTTP, a stateless protocol. It's both what makes the web so resilient and distributed and hard to control, as well what makes it so difficult to secure and build on top of.
