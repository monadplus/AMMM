# Lab 2

a) computer2.mod

b)

| -  | value optimal solution | solving algorithm | solving time | #variables | #constraints |
|:--:|:----------------------:|:-----------------:|:------------:|:----------:|:------------:|
| P1 | 0.723773179127243      | LP                | 0.12         | 10         | 13           |
| P2 |                        | MIP               | 0.19         | 10         | 13           |

P1 solution:

```
z = 0.72377;
x_tc = [[0.99587 0 0.0041322]
             [0 0.096347 0.90365]
             [0 1 0]
             [1 0 0]];
```

P2  solution:

```
z = 0.79924;
x_tc = [[1 0 0]
             [0 0 1]
             [0 1 0]
             [1 0 0]];
```

c) No feasible solution

d) computer3.mod

Leaves unassigned the maximum number of tasks - EXPECTED.

```
z = 0.3723;
x_tc = [[0 0 1]
             [0 0 0]
             [0 0 0]
             [1 0 0]
             [0 0 0]];
u_t = [0 1 1 0 1];
```

e) computer4.mod

```
z = 0.64194;
u_t = [0 1 0 0 0];
x_tc = [[1 0 0]
             [0 0 0]
             [0 1 0]
             [0 0 1]
             [0 0 1]];
```

f)

| -  | solving time | #variables | #constraints |
|:--:|:------------:|:----------:|:------------:|
| d) | 0.235        | 17         | 21           |
| e) | 0.285        | 17         | 21           |
