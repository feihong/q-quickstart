//Keywords

/abs

abs -23 -1 0 2 55

/all

all ()
all 78
all 1 1 1 1
all 1 1 0 1

/and

0101b and 0011b

/or

0101b or 0011b

/til

til 0
til 8

/take

0#0
0#1.0
0#`
0#""
3#1 2 3 4 5 6
-3#1 2 3 4 5 6
3 4#til 10

/type

type 42
type 3f
type 3 4 5
type 3.1 4.2 5.3
type "foo"
type `apl
type ()

//Operators

/& (and, lesser)

0101b&0011b
(&/)4 11 0 -2 5

/| (or, greater)

0101b|0011b
(|/)4 11 0 -2 5

//Iterators

/Do

10{x+3}/1 2 3

/Over

0-/1 2 3 4 5
(-/)1 2 3 4 5

/Scan

0-\1 2 3 4 5
(-\)1 2 3 4 5
