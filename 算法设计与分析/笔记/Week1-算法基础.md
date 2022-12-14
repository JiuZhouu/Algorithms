## 00 两个例子：调度问题与投资问题

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

## 01 问题复杂度 排序问题

问题计算复杂度的界定：排序问题

|     算法     | 最坏情况 | 平均情况 |
| :----------: | :------: | :------: |
|   插入排序   |    $O(n^2)$     | $O(n^2)$ |
|   冒泡排序   | $O(n^2)$ | $O(n^2)$ |
|   快速排序   | $O(n^2)$ | $O(nlogn)$ |
|    堆排序    | $O(nlogn)$ | $O(nlogn)$ |
| 二分归并排序 | $O(nlogn)$ | $O(nlogn)$ |

## 02 货郎问题与计算复杂性理论

问题

**货郎问题**：n个城市，已知任两个城市之间的距离，求一条每个城市恰好经过一次的回路，使总长度最小。

**0-1背包问题**，n个物品装入背包，背包最多允许装入重量B，如何选择装入背包的物品，使得总价值达到最大。

**双机调度问题**：n项任务，任务i的加工时间为ti，（完成时间是后停止加工机器的停机时间）求完成时间最小。

### NP-hard问题

大量存在于各个领域，至今没有找到有效算法：现有的算法的运行时间是输入规模的指数或更高阶函数。

### Algorithm+Data Structure=Programming

**好的算法**：提高求解问题的效率；节省存储空间

**算法的研究目标**：

问题--建模并求解算法

算法--算法的评价

算法类--问题复杂度估计

问题类--能够求解的边界

## 03 算法及其时间复杂度

**问题**：需要回答的一般性提问，通常含若干参数

**问题描述**：定义问题参数（集合、变量、序列、函数等）；说明每个参数的取值范围及参数间的关系；定义问题的解；说明解满足的条件（优化目标或约束条件）

**问题实例**：参数的一组赋值可得到问题的一个实例

**算法**：有限条指令序列，确定解决某个问题的一系列运算或操作

**算法A解决问题P**：问题P的任何实例都要作为算法A的输入；每步计算是确定性的；A能够在有限步内停机；输出该实例的正确的解。

### 基本运算与输入规模

**算法时间复杂度**：针对基本运算，计数算法所作运算次数

**输入规模**：输入串编码长度（数组元素多少，任务个数，图的顶点和边数）

算法基本运算次数可表示为输入规模的函数。

**基本运算**：排序，检索，位乘，相乘，置指针

### 算法的两种时间复杂度

最坏情况下的时间复杂度$W(n)$

平均情况下的时间复杂度$A(n)$

eg：检索 若x在L中，返回j是x首次出现的下标，否则返回j=0

顺序检索算法，改进顺序检索算法（L有序）

## 04 算法的伪码表示

赋值：<- 

分支语句：if...then...[else...]

循环语句：while, for, repeat until

转向语句：goto

输出语句：return

调用：直接写过程的名字

注释：//...

给出算法的主要步骤。

#### 需要多熟悉、多写

## 05 函数的渐近的界

#### 大O符号

定义：设$f$和$g$是定义域为自然数集$N$上的函数。若**存在正数$c$**和$n_0$，使得对一切$n≥n_0$有$0≤f(n)≤c*g(n)$成立，则称$f(n)$的渐近的上界是$g(n)$，

记作$f(n)=O(g(n))$

1、$f(n)=O(g(n))$，$f(n)$的阶不高于$g(n)$的阶。

2、可能存在多个正数c，只要指出一个即可。

3、对前面有限个值可以不满足不等式。

4、常函数可以写作$O(1)$。

#### 大$\Omega$符号

定义：设$f$和$g$是定义域为自然数集$N$上的函数。若**存在**正数$c$和$n_0$，使得对一切$n≥n_0$有$0≤c*g(n)≤f(n)$成立，则称$f(n)$的渐近的下界是$g(n)$，

记作$f(n)=\Omega(g(n))$

1、$f(n)=\Omega(g(n))$，$f(n)$的阶不低于$g(n)$的阶。

2、可能存在多个正数c，只要指出一个即可。

3、对前面有限个值可以不满足不等式。

#### 小O符号

定义：设$f$和$g$是定义域为自然数集$N$上的函数。若存在**任意正数$c$**都存在$n_0$，使得对一切$n≥n_0$有$0≤f(n)＜c*g(n)$成立（注意这里不是≤）

则记作$f(n)=o(g(n))$

1、$f(n)=o(g(n))$，$f(n)$的阶低于$g(n)$的阶。

2、对不同正数c，n0不一样，c越小n0越大。

3、对前面有限个值可以不满足不等式。

#### 小$\omega$符号

定义：设$f$和$g$是定义域为自然数集$N$上的函数。若存在**任意正数$c$**都存在$n_0$，使得对一切$n≥n_0$有$0≤c*g(n)＜f(n)$成立（注意这里不是≤）

则记作$f(n)=\omega(g(n))$

1、$f(n)=\omega(g(n))$，$f(n)$的阶高于$g(n)$的阶。

2、对不同正数c，n0不一样，c越大n0越大。

3、对前面有限个值可以不满足不等式。

#### $\Theta$符号

定义：设$f(n)=O(g(n))$且$f(n)=\Omega(g(n))$，

记作$f(n)=\Theta(g(n))$

表示$f(n)$和$g(n)$的阶相等，对前面有限个值可以不满足不等式。

#### 相关定理

高数求极限、、算同阶

阶具有传递性、可叠加性

## 06 几类重要的函数

介绍积累常用的函数的阶的性质，以及如何利用上述性质估计函数的阶。

### 基本函数类 

#### 阶的高低

指数级（爆炸性增长）：$2^n,3^n,n!,...$ 

多项式级（比指数级缓慢得多）：$n,n^2,nlogn,n^{1/2},...$  

对数多项式级（ 比多项式缓慢得多）：$logn,log^2n,loglogn,...$ 

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

#### Stirling公式

#### $n!=\sqrt{2\pi n}(\frac{n}{e})^n(1+\Theta(\frac{1}{n}))$

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
