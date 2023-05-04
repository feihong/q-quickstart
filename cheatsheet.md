# Cheatsheet

## Keywords

### abs

    abs -23 -1 0 2 55 --> 23 1 0 2 55

### all

    all () --> 1b
    all 78 --> 1b
    all 1 1 1 1 --> 1b
    all 1 1 0 1 --> 0b

### and

    0101b and 0011b --> 0001b

### or

    0101b or 0011b --> 0111b

### til

    til 0 --> `long$()
    til 8 --> 0 1 2 3 4 5 6 7

### take

    0#0 --> `long$()
    0#1.0 --> `float$()
    0#` --> `symbol$()
    0#"" --> ""
    3#1 2 3 4 5 6 --> 1 2 3
    -3#1 2 3 4 5 6 --> 4 5 6
    3 4#til 10 --> 0 1 2 3
                   4 5 6 7
                   8 9 0 1

### type

    type 42 --> -7h
    type 3f --> -9h
    type 3 4 5 --> 7h
    type 3.1 4.2 5.3 --> 9h
    type "foo" --> 10h
    type `apl --> -11h
    type () --> 0h

## Operators

### & (and, lesser)

    0101b&0011b --> 0001b
    (&/)4 11 0 -2 5 --> -2

### | (or, greater)

    0101b|0011b --> 0111b
    (|/)4 11 0 -2 5 --> 11

## Iterators

### Do

    10{x+3}/1 2 3 --> 31 32 33

### Over

    0-/1 2 3 4 5 --> -15
    (-/)1 2 3 4 5 --> -13

### Scan

    0-\1 2 3 4 5 --> -1 -3 -6 -10 -15
    (-\)1 2 3 4 5 --> 1 -1 -4 -8 -13
