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

/cut, drop

2 4 4 9 _ til 10
3_til 10
-3_til 10

/deltas

deltas 1 3 7 12 19

/or

0101b or 0011b

/rand

\S 73
rand each 30#5

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

/Each

(count')(1 2 3;4 5 6 7)
666,'(1 2 3;4 5 6 7)

/Each Left

"abc",\:"xy"

/Each Right

"abc",/:"xy"
(1+til 10)*/:1+til 10

/Each Prior

(,':)1 2 3 4

/Case

0 1 0 1'["abcd";"wxyz"]

/Converge

{0|x-1}\[10]

/Do

10{x+3}/1 2 3

/While

(0<){x div 3}\99

/Over

0-/1 2 3 4 5
(-/)1 2 3 4 5

/Scan

0-\1 2 3 4 5
(-\)1 2 3 4 5

//Dictionaries

"abc"!10 20 30
show dc:`c1`c2!(1 2 3; "abc")
dc[`c2; 1]
dc[`c1;]
dc[;2]
([] c1:10 20 30; c2:"abc")
