# Markdown

1. [Markdown简介](#1)
 + [块元素](#1.1)
 + [块元素](#1.2)
 + [杂项](#1.3)
2. [表格](#2)

<h2 id="1">Markdown简介</h2>

> Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档，然后转换成格式丰富的HTML页面。    —— [维基百科](https://zh.wikipedia.org/wiki/Markdown)

## Markdown基本语法

+ <h3 id="1.1">块元素</h3>

 - #### 段落和结束符
 段落比较容易理解，文本中的一行或者连续的多行是一个段落。不隔一个空行的换行行为，在一些编辑器中被解释为换行，即插入一个`<br />`标签。对与另外一些编辑器，会被解释为插入一个空格。对于后者，若要插入换行标签，请在当前一行的结尾打两个或者两个以上的空格。

 - #### 标题
 Markdown支持两种格式的标题： Setext 和 atx.
 Setext-style: 在标题下一行使用两个以上等号，表示一级标题；在标题下一行使用两个以上的减号，表示二级标题。比如：
		This is an H1
		=============

		This is an H2
		-------------
 atx-style: 支持1~6六级标题，通过在一行之前加上不同数量的#号来表示。比如：
 <pre><code>
	# This is an H1

	## This is an H2

	.......

	###### This is an H6
 </code></pre>

 - #### 引用
 通过在行首加上大于号 > 来添加引用格式，比如：
 ``` 
 > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
 > consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
 > Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
 > 
 > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
 > id sem consectetuer libero luctus adipiscing.
 ```
 Markdown允许只在段落的第一行行首加上大于号就OK了。比如：
 ```
 > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
   consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
   Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
 > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
   id sem consectetuer libero luctus adipiscing.
 ```
   引用可以嵌套：
 ```
 > This is the first level of quoting.
 >
 > > This is nested blockquote.
 >
 > Back to the first level.
 ```
 也可以嵌套其他格式：
 ```
 > ## 这是一个标题。
 >
 > 1.   这是第一行列表项。
 > 2.   这是第二行列表项。
 >
 > 给出一些例子代码：
 >
 >     return shell_exec("echo $input | $markdown_script");
 ```

 - #### 列表
   * ##### 无序列表
   无序列表使用星号、加号或是减号作为列表标记：
   ```
   *Red
   *Green
   *Blue
   ```
   等同于
   ```
   -Red
   -Green
   -Blue
   ```
   和
   ```
   +Red
   +Green
   +Blue
   ```
   * ##### 有序列表
   有序列表则使用数字接着一个英文句点：
   ```
   1.Bird
   2.McHale
   3.Parish
   ```
   数字不影响列表的序号，上面的显示等同于：
   ```
   1.Bird
   1.McHale
   1.Parish
   ```

 - #### 代码块
 Markdown使用代码块，直接在的行首键入4个空格或者1个tab键，Markdown会把它转换成`<pre>`和`<code>`标签。比如：
 在This is a code block.的前面键入1个tab键或者4个空格键，Markdown会把它转换成：
 ```
  <pre><code>This is a code block.
  </code></pre>
 ```
 - #### 内联代码 
 用反引号\` 来标记内联代码，它们会解释成`<code>`标签。如果代码的内容中有反引号，请用两个反引号包裹。

 - #### 分割线
 你可以在一行中用三个以上的星号、减号、底线来建立一个分隔线，行内不能有其他东西。你也可以在星号或是减号中间插入空格。下面每种写法都可以建立分隔线：
 `* * *`
 `***`
 `*****`
 `- - -`


+ <h3 id="1.2">区元素</h3>
 - #### 链接
 链接由一对中括号和一对圆括号构成，中括号里面是显示的链接名称，圆括号是URL，比如：
 ```
 This is [an example](http://example.com/ "Title") inline link.
 ```
 Markdown会处理成：
 ```
 <p>This is <a href="http://example.com/" title="Title">
 an example</a> inline link.</p>
 ```
 除了上面的行内式，也可以使用参考式：
 ```
 This is [an example] [id] reference-style link
 ```
 然后在任意空白位置定义：
 		[id]: http://example.com/  "Optional Title Here"'

 
 - #### 强调
 ```
 *这是斜体*
 _这也是斜体_
 **这是粗体**
 ***这是粗体+斜体***
 ~~删除线~~
 ```
 - #### 图片
 Markdown插入图片同样有两种方式：inline and reference.
 Inline syntax:
 ```
 ![Alt text](/path/to/img.jpg)
 ![Alt text](/path/to/img.jpg "Optional Title")
 ```
 Reference-style syntax:
 ```
 ![Alt text][id]
 ```
 “id” 是引用图片的is the name of a defined image reference. Image references are defined using syntax identical to link references:
 		[id]: url/to/image  "Optional title attribute"'

+ <h3 id="1.3">杂项</h3>
 - #### 转义
 markdown支持在以下字符前面插入反斜杠：
 		\   反斜线
 		`   反引号
 		*   星号
 		_   底线
 		{}  花括号
 		[]  方括号
 		()  括弧
		 #   井字号
		 +   加号
		 -   减号
		 .   英文句点
 		!   惊叹号

 - #### 内联HTML
 markdown 的语法简洁，但有其局限性，所以特意保留了内联html这种方式。任何html标签及其内容，都会原样输出到结果中。也就是说，标签中的星号等作为markdown结构的符号，以及构成html标签和实体的符号，都不会做任何转义。


<h2 id="2">表格</h2>

 | Item     | Value | Qty   |
 | :------- | :----: | :---: |
 | Computer | $1600 |  5    |
 | Phone    | $12   |  12   |
 | Pipe     | $1    |  234  |

注意：第二行的冒号决定了居左居右还是居中，如果不加冒号，默认是居左的。
