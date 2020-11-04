% Non-linear Programming
% Arnau Abella
% November 04, 2020

# Non-linear Programming

Tools for visualization:

- [Desmos](https://www.desmos.com/calculator/)
- [CalcPlot3d](https://www.monroecc.edu/faculty/paulseeburger/calcnsf/CalcPlot3D/)

## Basic definition and examples

**Definition**: In a non-linear program, a non-linear expressions arises either in the objective function and/or in the constraints.

**Example 1** 

An engineering factory can produce two types of product (PROD 1, PROD 2).
For each product, when producing x units we get the following contributions to net profit:

```
PROD 1                             PROD 2
550 - 1/(1 + x)                    600 - 2/(1 + x)
^^^ selling price per unit
      ^^^^^^^^^ production cost per unit when producing x units
```

Our total net profit will be represented by the expression:

```
(550 - 1/(1 + x1)) x1 + (600 - 2/(1 + x2)) x2
```

**Example 2** 

We have to place two items at coordinates (x1, y1) and (x2, y2) respectively in such a way that their distance is at least 10 kms. 
Then the following constraint must hold:

```
sqrt( (x1 - x2)^2 + (y1 - y2)^2 ) ≥ 10
```

or equivalently

```
(x1 - x2)^2 + (y1 - y2)^2 ≥ 100 // ^2 are non linear
```

### Solving non-linear programs

Non-linear programs are more difficult to solve than linear programs of the same size.

It is, however, often possible to solve an approximation through either:

* linear programming
* or an extension of linear programming known as **separable programming**.

Which case is applicable depends upon an important classification of non-linear programs into:

* convex
* and non-convex

## Convex programming and non-convex programming

Non-linear programming can be divided into convex programming and non-convex programming.

### Convex region

**Definition.** A region of space is said to be convex if the portion of the straight line between any two points in the region also lies in the region.

Examples (on the plane):

* Convex region: <https://www.desmos.com/calculator/iztyjllvr3> and <https://www.desmos.com/calculator/ylevj0984b>
* Non-convex region: <https://www.desmos.com/calculator/vxuz3btrkr>

### Convex function

**Definition**. Let X be a convex set in a real vector space and let $f : X \to \mathbb{R}$ be a function:

* f is called a **convex** if: 

$$
\forall x_1, x_2 \in X, \forall t \in [0,1]:  f(t x_1 + (1 - t)x_2) \leq t f(x_1) + (1-t)f(x_2)
$$

* f is called a **strictly convex** if:

$$
\forall x_1 \neq x_2 \in X, \forall t \in (0, 1):  f(t x_1 + (1 - t)x_2) < t f(x_1) + (1-t)f(x_2)
$$

* A function `f` is said to be (strictly) concave if `-f` is (strictly) convex.

Examples:

* convex-function <https://www.desmos.com/calculator/gcfyklzjqc>
* non-convex-function <https://www.desmos.com/calculator/wfgqutqlp3>

The definitions naturally extend to more dimensions: <https://www.monroecc.edu/faculty/paulseeburger/calcnsf/CalcPlot3D>

Example of convex function: 

```
x^2 + y^2      -1 ≤ x ≤ 2, -2 ≤ y ≤ 2
```

Example of non-convex function: 

```
x -x^3 + y     -2 ≤ x ≤ 2, -2 ≤ y ≤ 2
```

### Convex program

An optimization problem is said to be convex if it involves the _minimization_ of a convex function over a convex feasible region.

**Example 1**

The following is a convex program:

```
Minimize
  x^2 + y^2

Subject To

  x + y ≤ 4,
  2x + y ≤ 5,
  - x + 4 y ≥ 2,
  x, y ≥ 0
```

**Example 2**

The following is *not* a convex program (The objective function is not convex):

```
Minimize
  x -x^3 + y

Subject To

  x + y ≤ 4,
  2x + y ≤ 5,
  - x + 4 y ≥ 2,
  x, y ≥ 0
```

**Example 3**

The following is *not* a convex program (the feasible region is not convex (draw it)):

```
Minimize
  x^2 + y^2 -- This is convex

Subject To

  x^2 + y^2 ≥ 4,
  x^2 + y^2 ≤ 16,
```

## Linear Programming

It may not always be easy to decide whether a problem is convex or not. But for example, linear programming (LP) is a special case of convex programming:

* All linear programs can be expressed as minimizations of linear functions.
* Any linear function is a convex function (hyperplanes are convex regions)
* The feasible region defined by a set of linear constraints can easily be shown to be convex (the intersection of convex regions is a convex region).

## [Quadratic Programming](https://en.wikipedia.org/wiki/Quadratic_programming#Problem_formulation)

The quadratic programming problem with _n_ variables and _m_ constraints can be formulated as follows

Given: 

* a real-valued, n-dimensional vector $c$
* an $n x n$-dimensional real symmetric matrix $Q$
* an $m x n$-dimensional real matrix $A$, and
* an $m$-dimensional real vector $b$,

the objective of quadratic programming is to find an $n$-dimensional vector $x$, that will

```
minimize  
  1/2 x^{T}Qx + c^{T}x

subject to 
  Ax ⪯ b
```

where $x^T$ denotes teh vector transpose of $x$A. The notation $Ax \preceq b$ means that every entry of the 
vector $Ax$ is less than or equal to the corresponding entry of the vector $b$ (componentwise inequality)

If the feasible region is defined by linear inequalities, then we have a convex program.

### Local and Global minima

Given a minimization problem of the form min {f(x) |  x is in S},

* a global minimum is z in S such that for all y in S, f(z) ≤ f(y)
* a local minimum is z in S such that for all y in S "close to z" (neighborhood), f(z) ≤ f(y**

A global minimum is a local minimum, but the converse may not hold.

**Examples**

* convex-model <https://www.desmos.com/calculator/31rfwt7jmu>
* non-convex-model <https://www.desmos.com/calculator/aqsha3niby>

### Relation with convexity

In a convex program, a local minimum is a global minimum. 

If it is not convex, this may not hold.

### Algorithmic implications

The possibility of local optima that are not global optima in non-convex programs is what makes such problems much more difficult to solve than convex programs.

Many algorithms for non-linear programming can only guarantee to find local optima. They give global optima for convex programs, but may not for non-convex programs.

## Separable Programming

###  Separable function

A separable function is a function that can be expressed as the sum of functions of a single variable.

Examples:

```
x_1^2 + 2 x_2 + e^x_3   is separable
x_1 x_2                 is not separable
```

It is important that functions are separable because they can be approximated by *piecewise linear functions*.

### Approximating with piecewise linear functions

In order to convert a non-linear program into a suitable form for separable programming, it is necessary to make piecewise linear approximations to each of the non-linear functions of a single variable arising in the problem.

It does not matter whether the non-linearities are in the objective function or the constraints or both.

**Example 1**

The following is a convex program (<https://www.desmos.com/calculator/oya0rhkzpk>):

```
Minimize
  x^2 - 4 x - 2 z

Subject To

  x + z ≤ 4,
  2x + z ≤ 5,
  - x + 4 z ≥ 2,
  x, z ≥ 0
```

The objective function $x^2 - 4 x - 2 z$ is separable.
The only non-linear term is $x^2$.

$x^2$ can be approximated piecewise for $0 \leq x \leq 2.5$ as follows (<https://www.desmos.com/calculator/1ogxifen8b>):

First, we split the interval $0 ≤ x ≤ 2.5$ into pieces, over which the function will be approximated with a linear function:

```
0 ≤ x ≤ 1
1 ≤ x ≤ 2
2 ≤ x ≤ 2.5
```

Recall that the linear segment through points (x1, y1) and (x2, y2) can be described in parametric form as:

```
(x, y) = (x1, y1) + λ ((x2, y2) - (x1, y1))
       = (1 - λ) (x1, y1) + λ (x2, y2)          for 0 ≤ λ ≤ 1
```

Equivalently we can write

```
(x, y) = λ' (x1, y1) + λ (x2, y2)            for 0 ≤ λ, λ' such that λ + λ' = 1
```

For 0 ≤ x ≤ 1, we have that x^2 passes through points (0, 0) and (1, 1).
We write the segment through points (0, 0) and (1, 1) in parametric form:

```
(x, y) = λ2 (1, 1) + λ1 (0, 0)       for 0 ≤ λ1, λ2 such that λ1 + λ2 = 1
```

For 1 ≤ x ≤ 2, we have that x^2 passes through points (1, 1) and (2, 4).
We write the segment through points (1, 1) and (2, 4) in parametric form:

```
(x, y) = λ3 (2, 4) + λ2 (1, 1)   for 0 ≤ λ2, λ3 such that λ2 + λ3 = 1
```

For 2 ≤ x ≤ 2.5, we have that x^2 passes through points (2, 4) and (2.5, 6.25).
We write the segment through points (2, 4) and (2.5, 6.25) in parametric form:

```
(x, y) = λ4 (2.5, 6.25) + λ3 (2, 4)   for 0 ≤ λ3, λ4 such that λ3 + λ4 = 1
```

Altogether we can write

```
(x, y) = λ1 (0, 0) + λ2 (1, 1) + λ3 (2, 4) + λ4 (2.5, 6.25)

// equiv to:

x = λ2 + 2 λ3 + 2.5  λ4
y = λ2 + 4 λ3 + 6.25 λ4

for 0 ≤ λ1, λ2, λ3, λ4 ≤ 1 such that λ1 + λ2 + λ3 + λ4 = 1
and at most two adjacent of λ1, λ2, λ3, λ4 can be non-zero // Otherwise there wouldn't be a segment.
```

The resulting model is

```
Minimize
  y - 4 x - 2 z

Subject To

  x + z ≤ 4,
  2x + z ≤ 5,
  - x + 4 z ≥ 2,
  -x + λ2 + 2 λ3 + 2.5  λ4 = 0,
  -y + λ2 + 4 λ3 + 6.25 λ4 = 0,
  λ1 + λ2 + λ3 + λ4 = 1,
  x, z, λ1, λ2, λ3, λ4 ≥ 0
  *and at most two adjacent of λ1, λ2, λ3, λ4 can be non-zero*
```

### Non-linearities in the constraints

If non-linear functions also appear in the constraints the analysis is just the same. 
They are replaced by linear terms and a piecewise linear approximation made to the non-linear function. 

Variables $\lambda_i$ are then introduced in order to relate the new term to the old.

### Critical condition for convex problems

When the objective function is _convex_, it can be proved that the condition _and at most two adjacent of λ1, λ2, λ3, λ4 can be non-zero_  is automatically fulfilled.

The intuition is that any point not satisfying the condition will belong to the interior of the polygon defined by the extreme points of the pieces (their convex hull), and can be improved by projecting over the piecewise approximation. Therefore the solutions will always lie on one of the line segments.

### Critical condition for non-convex problems

If the objective function is not convex, in order to guarantee that *at most two adjacent of λ1, λ2, λ3, λ4 can be non-zero* we have to enforce it explicitly.

**Example 2: revisited**

To illustrate that the condition has to be enforced explicitly, consider the following non-convex program:

```
Minimize
  x -x^3 + z

Subject To

  x + z ≤ 4,
  2x + z ≤ 5,
  - x + 4 z ≥ 2,
  x, z ≥ 0
```

The objective function is _not convex_.

Let us assume we make a piecewise approximation of x^3.

```
0   ≤ x ≤ 1
1   ≤ x ≤ 1.5
1.5 ≤ x ≤ 2
```

The resulting model is

```
Minimize
  x - y + z

Subject To

  x + z ≤ 4,
  2x + z ≤ 5,
  - x + 4 z ≥ 2,
  x = ...
  y = ...
  sum of λ's = 1
  *at most two adjacent of λ1, λ2, λ3, λ4 can be non-zero*
```

When we minimize -y we maximize y, so the optimization will take us *away* from the piecewise approximation rather than down on it. 
In the convex hull of the extreme points of the piecewise approximation, it is better to move away from the piecewise approximation.

#### Separable modification of the simplex algorithm

If the objective function is not convex, we can use the separable programming modification of the simplex algorithm, which never allows more than two non-zero adjacent $\lambda$ into the solution. 
Unfortunately this algorithm only guarantees a local optimum (which may not be the global minimum).

#### Integer linear programming for global optima

To ensure that a global optimum is found, we can use integer linear programming to encode that at most two adjacent of $\lambda$s can be non-zero. 
We can specify that the set of variables $(\lambda_1, \lambda_2, \ldots, \lambda_n)$ is an *SOS2* (Special Ordered Set of type 2).

_Definition_. A SOS2 is a set of variables in which at most two can be non-zero, and moreover the two variables must be adjacent in the ordering given to the set.

**Encoding a SOS2 set in ILP**

Suppose $(x_1, x_2, \ldots, x_n )$ is an SOS2 set.

* If the variables are not 0–1, we introduce 0–1 indicator variables

```
μ1, μ2, ..., μn such that

  μ_i = 0 -> x_i = 0
```

and link them to the $x_i$ variables in the conventional way by constraints:

```
xi − Mi μi ≤ 0,   i = 1, 2, ..., n,
xi − mi μi ≥ 0,   i = 1, 2, ..., n,
```

where Mi and mi are constant coefficients being upper and lower bounds respectively for xi.

* If the $x_i$ variables are 0–1, we can immediately regard them as the $\mu_i$ variables (this is our case).

We introduce 0–1 variables δ1 , δ2 , ..., δ{n−1} together with the following constraints:

```
μ1 ≤      δ1
μ2 ≤ δ1 + δ2
μ3 ≤ δ2 + δ3
μ4 ≤ δ3 + δ4
μ5 ≤ δ4 + δ5
...
μn-1 ≤ δ{n-2} + δ{n-1}
μn   ≤ δ{n-1}

δ1 + δ2 + ... + δ{n−1} = 1
```

If δi != 0, then only μi and μ{i+1} can be != 0.

On the other hand, there exist modifications of the branch & bound procedure that impose the constraints that a 
set of variables is a SOS2 algorithmically, without having to explicitly enforcing these constraints.

```
Minimize
  x - y + z

Subject To

  x + z ≤ 4,
  2x + z ≤ 5,
  - x + 4 z ≥ 2,
  x = ...
  y = ...
  sum of λ's = 1

  // For all λ
  λ_i − μ_i ≤ 0
  λ_i ≥ 0

  μ1 ≤      δ1
  μ2 ≤ δ1 + δ2
  μ3 ≤ δ2 + δ3
  μ4 ≤ δ3 + δ4
  μ5 ≤ δ4 + δ5
  μ6 ≤ δ5

  δ1 + δ2 + ... + δ6 = 1
```

### Converting a problem to a separable model

The restriction of only allowing non-linear functions to be separable
might seem too severe. But in fact, it is possible to convert many
non-linear programming problems into separable models.

##### Product terms I

A very common non-separable function is the product of two variables,
e.g. x1 x2. The model is easily converted into a separable form,
however, by the following transformation:

1. Introduce two new variables u1 and u2 into the model

2. Relate u1 and u2 to x1 and x2 by the relations

  ```
  u1 = 1/2(x1 + x2)
  u2 = 1/2(x1 - x2)
  ```

3. Replace the term x1 x2 in the model by u1^2 − u2^2

If the product of more than two variables occurs in a model, then the
above procedure can be repeated successively to reduce the model to a
separable form.

##### Product terms II

An alternative way of dealing with product terms in a non-linear model
is to use logarithms:

1. Replace x1 x2 by a new variable y;

2. Relate y to x1 and x2 by the equation

  ```
  log y = log x1 + log x2
  ```

The last equation is non-linear, but the expression is separable.

Care must be taken, however, when this transformation is made to
ensure that neither x1 nor x2 (and consequently y) ever take the value 0. 
If this were to happen their logarithms would become $-\infty$. It may be
necessary to translate x1 and x2 by certain amounts to avoid this ever
happening.

The use of logarithms to convert a non-linear model to a suitable form
sometimes leads to computational problems. This can happen if both a
variable and its logarithm occur together in the same model: as they
are likely to be of widely different orders of magnitude, numerical
inaccuracy may lead to computational difficulties.

##### Changes of variables in general

Many other non-linear functions of more than one variable can be
reduced to non-linear functions of a single variable by the addition
of extra variables and constraints.

##### Alternative to separable programming

Non-linear functions of more than one variable can be dealt with in 
yet another way by generalizing a piecewise linear approximation to more dimensions. 
A more complex relationship then has to be specified between the λi.
