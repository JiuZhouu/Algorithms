# 分治算法的典型应用

## 00 内容简介

选择问题：选最大，选最大与最小，选第二大，选第k小

信号平滑处理：快速傅立叶变换FFT算法、卷积计算、卷积及应用

计算几何：计算平面点集的凸包



## 01 选最大与最小

1、选最大：

算法：顺序比较；最坏情况下时间W(n)=n-1

2、选最大最小：

算法：顺序比较选最大max，顺序比较在其余数组中选最小min；时间复杂性W(n)=n-1+n-2=2n-3

3、分组算法

按组别进行比较大小

![image-20221224101637904](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212241016076.png)

$\lceil{3n/2}\rceil-2$

4、分治算法 3n/2-2



## 02 选第二大

1、顺序比较：先找max，在剩下n-1个数中找second max，时间复杂度2n-3

2、提高效率的途径

成为second max的条件，仅在与max的比较中被淘汰，so在确定最大数的过程中记录被max直接淘汰的元素，在这个范围内找max。

设计思想：用空间换时间。

3、锦标赛算法

两两分组比较，淘汰元素记录在链表上，检查max的链表找最大的是second max。

$n+\lfloor{logn}\rfloor-2$



## 03 一般选择问题的算法设计与分析

一般性选择问题：选第k小

![image-20221224103323845](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212241033068.png)

![image-20221224103344111](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212241033900.png)

分治策略-确定$m*$-用$m*$划分数组归约为子问题-递归实现

## 04 卷积及应用

卷积和多项式乘法有密切联系

卷积应用：信号平滑处理

## 05 卷积计算

1、卷积等价于多项式相乘，蛮力算法：$O(n^2)$

2、高斯滤波的权值函数

![image-20221228211756841](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282118067.png)

![image-20221228211832041](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282118645.png)

![image-20221228211846640](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282119713.png)

![image-20221228212241433](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282122728.png)

确定x的取值：多项式对x求值

![image-20221228212529773](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282125725.png)

![image-20221228212743764](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282127461.png)

## 06 快速傅立叶变换FFT算法

1、多项式求值算法

给定多项式$A(x)=a_0+a_1x+...+a_{n-1}x^{n-1}$，设x为1的2n次方根，对所有的x求A(x)的值。

蛮力算法：依次计算每个项。时间复杂度$O(n^3)$

改进算法：$A_n(x)=a_0+xA_{n-1}(x)$，时间复杂度$O(n^2)$

2、分治多项式求值算法

偶系数与奇系数多项式

![image-20221228215115559](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282151495.png)

![image-20221228215321932](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282153971.png)

$T(n)=O(nlogn)$

![image-20221228220028350](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282200835.png)

## 07 平面点集的凸包

![image-20221228220402098](https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/mac/202212282204975.png)

连接最大纵坐标点和最小纵坐标点划l分左右点集，在子集中确定距l最远的点P，在三角形内的点删除，三角形两条边外的点分别形成两条边的子问题。

$T(n)=O(n^2)$

Graham扫描算法$O(nlogn)$



**小结：分治算法设计**

1、将原问题规约为子问题：

直接划分注意尽量均衡；通过计算规约为特殊的子问题；子问题与原问题具有相同的性质；子问题之间独立计算。

2、算法实现：递归或迭代实现；注意递归执行的边界

3、时间复杂度分析：给出关于时间复杂度函数的递推方程和初值；求解方程

4、提高效率的途径：减少子问题个数；预处理

5、重要的分治算法

检索算法：二分检索

排序算法：快速排序、二分归并排序

选择算法

快速傅立叶变换FFT算法

平面点集的凸包
