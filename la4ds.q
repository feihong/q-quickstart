// Linear Algebra for Data Science, selected exercises

\S 73

// 2-2

norm:{sqrt sum x*x}
show norm 3 4
show norm 5 12

// 2-3

unit:{x%norm x}

// 2-4

arbmag:{[v;mag] mag*unit v}

// 2-6

dot:{sum x*y}
v:1 2 3f
dot[v;v]={x*x}norm v

// 2-7

