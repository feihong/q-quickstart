# Cheatsheet

## Keywords

### abs

```q
q)abs -23 -1 0 2 55
23 1 0 2 55
```

### all

```q
q)all ()
1b
q)all 78
1b
q)all 1 1 1 1
1b
q)all 1 1 0 1
0b
```

### and

```q
q)0101b and 0011b
0001b
```

### cut, drop

```q
q)2 4 4 9 _ til 10
2 3
`long$()
4 5 6 7 8
,9
q)3_til 10
3 4 5 6 7 8 9
q)-3_til 10
0 1 2 3 4 5 6
```

### deltas

```q
q)deltas 1 3 7 12 19
1 2 4 5 7
```

### or

```q
q)0101b or 0011b
0111b
```

### rand

```q
q)\S 73
q)rand each 30#5
4 0 2 1 2 1 2 3 2 4 1 0 2 4 1 2 0 1 1 2 1 0 0 1 2 3 4 4 2 4
```

### til

```q
q)til 0
`long$()
q)til 8
0 1 2 3 4 5 6 7
```

### take

```q
q)0#0
`long$()
q)0#1.0
`float$()
q)0#`
`symbol$()
q)0#""
""
q)3#1 2 3 4 5 6
1 2 3
q)-3#1 2 3 4 5 6
4 5 6
q)3 4#til 10
0 1 2 3
4 5 6 7
8 9 0 1
```

### type

```q
q)type 42
-7h
q)type 3f
-9h
q)type 3 4 5
7h
q)type 3.1 4.2 5.3
9h
q)type "foo"
10h
q)type `apl
-11h
q)type ()
0h
```

## Operators

### & (and, lesser)

```q
q)0101b&0011b
0001b
q)(&/)4 11 0 -2 5
-2
```

### | (or, greater)

```q
q)0101b|0011b
0111b
q)(|/)4 11 0 -2 5
11
```

## Iterators

### Each

```q
q)(count')(1 2 3;4 5 6 7)
3 4
q)666,'(1 2 3;4 5 6 7)
666 1 2 3
666 4 5 6 7
```

### Each Left

```q
q)"abc",\:"xy"
"axy"
"bxy"
"cxy"
```

### Each Right

```q
q)"abc",/:"xy"
"abcx"
"abcy"
q)(1+til 10)*/:1+til 10
1  2  3  4  5  6  7  8  9  10 
2  4  6  8  10 12 14 16 18 20 
3  6  9  12 15 18 21 24 27 30 
4  8  12 16 20 24 28 32 36 40 
5  10 15 20 25 30 35 40 45 50 
6  12 18 24 30 36 42 48 54 60 
7  14 21 28 35 42 49 56 63 70 
8  16 24 32 40 48 56 64 72 80 
9  18 27 36 45 54 63 72 81 90 
10 20 30 40 50 60 70 80 90 100
```

### Each Prior

```q
q)(,':)1 2 3 4
1  
2 1
3 2
4 3
```

### Case

```q
q)0 1 0 1'["abcd";"wxyz"]
"axcz"
```

### Converge

```q
q){0|x-1}\[10]
10 9 8 7 6 5 4 3 2 1 0
```

### Do

```q
q)10{x+3}/1 2 3
31 32 33
```

### While

```q
q)(0<){x div 3}\99
99 33 11 3 1 0
```

### Over

```q
q)0-/1 2 3 4 5
-15
q)(-/)1 2 3 4 5
-13
```

### Scan

```q
q)0-\1 2 3 4 5
-1 -3 -6 -10 -15
q)(-\)1 2 3 4 5
1 -1 -4 -8 -13
```

## Dictionaries

```q
q)"abc"!10 20 30
a| 10
b| 20
c| 30
q)show dc:`c1`c2!(1 2 3; "abc")
c1| 1 2 3
c2| a b c
q)dc[`c2; 1]
"b"
q)dc[`c1;]
1 2 3
q)dc[;2]
c1| 3
c2| "c"
q)([] c1:10 20 30; c2:"abc")
c1 c2
-----
10 a 
20 b 
30 c 
```

