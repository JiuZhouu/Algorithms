# 序列求和与递推方程

## 00 内容简介-算法的数学基础 

算法迭代->计算工作量->序列求和

序列求和的方法：（1）求和公式；（2）估计和式的上界；

递推方程的求解方法：

（1）迭代法：基本迭代、换元迭代

（2）差消法化简 （3）递归树模型

化简模型--差消法化简、递归树模型

递推方程主定理的应用及其证明

## 01 序列求和的方法

数列求和公式：等差数列，等比数列，调和级数

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202212032016787.png" alt="image-20221124150702886" style="zoom:67%;" />

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202212032033774.png" alt="image-20221203203352300" style="zoom: 67%;" />

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202212032044047.png" alt="image-20221203204443234" style="zoom:67%;" />

估计序列和：放大法求上界，用积分做和式的渐近的界



## 02 递推方程与算法分析

**递推方程**：序列{$a_n$}，一个把${a_n}$与某些个${a_i(i<n)}$联系起来的等式。

**递推方程的求解**：给定关于序列{${a_n}$}的递推方程和若干初值，计算${a_n}$。

eg斐波那契数列：1，1，2，3，5，8，13，21

给出递推方程和初值，可以推算到解fn，表达成n的函数

**递归算法**：Hanoi挪盘子

**插入排序**：插入一个数，需要和前面每一个排好的数，从后向前，依次比较。

基本运算是元素比较，对规模为n的输入最坏的情况下的时间复杂度W(n)=W(n-1)+n-1,W(1)=0,最终解得W(n)=n(n-1)/2。



## 03 迭代法求解递推方程

**迭代法**

不断用地推方程的右部替换左部；

每次替换，随着n的降低在和式中多出一项；

直到出现初值停止迭代；

将初值带入并对和式求和；

可用数学归纳法验证解的正确性。

**换元迭代**

将对n的递推式换成对其他变元k的递推式

对k直接迭代

将解（关于k的函数）转换成关于n的函数



## 04 差消法求解递推方程

**快速排序**：用首元素做划分标准，比较之后划成两半，把首元素再放进去。划分成两个子问题，再继续递归排序。

工作量：子问题工作量+划分工作量

对于高阶方程应该先化简为一阶方程，然后迭代

利用两个方程相减，将右边的项尽可能小区，以达到降阶的目的



## 05 递归树

递归树是迭代计算的模型，生成过程与迭代过程一致。

递归树上所有项恰好是迭代之后产生和式之后的项，对递归树上的项求和就是迭代后方程的解。

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202212041744821.png" alt="image-20221204174442328" style="zoom:67%;" />

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202212041746038.png" alt="image-20221204174644196" style="zoom:67%;" />

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202212041748091.png" alt="image-20221204174852965" style="zoom:67%;" />

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202212041749044.png" alt="image-20221204174934398" style="zoom:67%;" />
