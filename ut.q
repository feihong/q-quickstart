/ adapted from https://github.com/psaris/funq/blob/master/ut.q

\d .ut

/ assert minimum required version of q

/ throw verbose exception if x <> y
assert:{if[not x~y;'`$"expecting '",(-3!x),"' but found '",(-3!y),"'"]}

assert[2016.05.12] 2016.05.12&.z.k / supports random permutation 0N?
assert[3.4] 3.4&.z.K  / supports reshape for an arbitrary list of dimensions

/ general utilities

/ generate a sequence of (s)-sized steps between (b)egin and (e)nd
sseq:{[s;b;e]b+s*til 1+floor 1e-14+(e-b)%s}

/ generate a sequence of (n) steps between (b)egin and (e)nd
nseq:{[n;b;e]b+til[1+n]*(e-b)%n}

/ allocate x into n bins
nbin:{[n;x](n-1)&floor n*.5^x%max x-:min x}

/ Heckbert's axis label algorithm

/ use Heckbert's values to (r)ou(nd) or floor (x) to the nearest nice number
nicenum:{[rnd;x]
 s:`s#$[rnd;0 1.5 3 7;0f,1e-15+1 2 5f]!1 2 5 10f;
 x:f * s x%f:10 xexp floor 10 xlog x;
 x}

/ given suggested (n)umber of labels and the (m)i(n) and (m)a(x) values, use
/ Heckbert's algorithm to generate a series of nice numbers
heckbert:{[n;mn;mx]
 r:nicenum[0b] mx-mn;           / range of values
 s:nicenum[1b] r%n-1;           / step size
 mn:s*floor mn%s;               / new min
 mx:s*ceiling mx%s;             / new max
 l:sseq[s;mn;mx];               / labels
 l}

/ plotting utilities

/ cut m x n matrix X into (x;y;z) where x and y are the indices for X
/ and z is the value stored in X[x;y] - result used to plot heatmaps
hmap:{[X]@[;0;`s#]tcross[til count X;reverse til count X 0],enlist raze X}

/ using (a)ggregation (f)unction, plot (X) using (c)haracters limited to
/ (w)idth and (h)eight. X can be x, (x;y), or (x;y;z)
plot:{[w;h;c;af;X]
 if[type X;X:enlist X];               / promote vector to matrix
 if[1=count X;X:(til count X 0;X 0)]; / turn ,x into (x;y)
 if[2=count X;X,:count[X 0]#1];       / turn (x;y) into (x;y;z)
 if[not `s=attr X 0;c:1_c];           / remove space unless heatmap
 l:heckbert[h div 2].(min;max)@\:X 1; / generate labels
 x:-1_nseq[w] . (min;max)@\:X 0;      / compute x axis
 y:-1_nseq[h] . (first;last)@\:l;     / compute y axis
 Z:(y;x) bin' "f"$X 1 0;              / allocate (x;y) to (w;h) bins
 Z:af each X[2]group flip Z;          / aggregating overlapping z
 Z:c nbin[count c;0f^Z];              / map values to characters
 p:./[(h;w)#" ";key Z;:;value Z];     / plot points
 k:@[count[y]#0n;0|y bin l;:;l];      / generate key
 p:reverse k!p;                       / generate plot
 p}

c10:" .-:=+x#%@"                         / 10 characters
c16:" .-:=+*xoXO#$&%@"                   / 16 characters
c68:" .'`^,:;Il!i><~+_-?][}{1)(|/tfjrxn" / 68 characters
c68,:"uvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$"

plt:plot[80;20;c10;avg]         / default plot function

/ generate unicode sparkline (with nulls rendered as spaces)
spark:{
 s:("c"$226 150,/:129+til 8) nbin[8] x; / map to 8 unicode characters
 if[n:count w:where null x;s[w]:(n;3)#"c"$226 128 136]; / replace null values
 s:raze s;
 s}
