## 两个例子：调度问题与投资问题

1、调度问题：n项任务加工时间已知，完成时间=0时刻到加工时间结束，求总完成时间最短。

解：按加工时间从小排到大。

2、问题建模：定义好输入、输出和目标函数，求解。

3、算法正确性：对所有输入实例得到最优解。-结论可以证明

4、直觉不一定是正确的。eg背包装物品。

5、算法设计：

（1）**问题建模**：对输入参数和解给出形式化或半形式化的描述

（2）**选择什么算法？**如何描述这个方法？

（3）这个方法是否对所有实例得到最优解？如何证明？

（4）如果不是，能否找到反例?

（5）**分析算法**-效率

6、投资问题：m元投资n给项目，效益函数f(x)，求如何分配每个项目使收益最大。

7、穷举蛮力算法：考察计算每一个方案，选一个方案最大的。

## 问题复杂度 排序问题

问题计算复杂度的界定：排序问题

|     算法     | 最坏情况 | 平均情况 |
| :----------: | :------: | :------: |
|   插入排序   |    $O(n^2)$     | $O(n^2)$ |
|   冒泡排序   | $O(n^2)$ | $O(n^2)$ |
|   快速排序   | $O(n^2)$ | $O(nlogn)$ |
|    堆排序    | $O(nlogn)$ | $O(nlogn)$ |
| 二分归并排序 | $O(nlogn)$ | $O(nlogn)$ |

## 货郎问题与计算复杂性理论





## 几类重要的函数

介绍积累常用的函数的阶的性质，以及如何利用上述性质估计函数的阶。

### 基本函数类 

#### 阶的高低

指数级：$2^n,3^n,n!,...$ 爆炸性增长

多项式级：$n,n^2,nlogn,n^{1/2},...$  比指数级缓慢得多

对数多项式级：$logn,log^2n,loglogn,...$  比多项式缓慢得多

### 对数函数

#### 符号

$logn=log_2n$

$log^kn=(logn)^k$

$loglogn=log(logn)$

#### 性质

(1) $log_2n=\Theta(log_ln)$ 表示它们同阶，log的底不重要

(2) $log_bn=o(n^a)  a>0$  表示前面的阶低于后面的阶

(3) $a^{log_bn}=n^{log_ba}$

### 指数函数与阶乘

#### Stirling公式：$n!=\sqrt{2\pi n}(\frac{n}{e})^n(1+\Theta(\frac1n))$

$n!=o(n^n)$

$n!=\omega(2^n)$

$log(n!)=\Omega(nlogn)=O(nlogn)$  所以它们同阶$log(n!)=\Theta(nlogn)$ 

#### 应用：估计搜索空间大小

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202210301652694.png" alt="image-20221030165248719" style="zoom: 50%;" />

### 取整函数

取整函数的定义

$\lceil x \rceil$ x向下取整

$\lfloor x \rfloor$ x向上取整

二分检索输入数组长度n，中位数位置$\lfloor n/2 \rfloor$，与中位数比较后子问题大小$\lfloor n/2 \rfloor$ 

$\lfloor \frac{n}{2} \rfloor+ \lceil \frac{n}{2} \rceil=n$



从高到低阶的排序

<img src="https://raw.githubusercontent.com/JiuZhouu/ImageBed/main/img/202210301653128.png" alt="image-20221030153802558" style="zoom:50%;" />
