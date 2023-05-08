//How many people are in each age bucket?

/Example from [Mastering Dyalog APL](https://mastering.dyalog.com/Introduction.html#a-useful-application)

ages:73 16 42 50 2 67 11 81 37 93 100 98 83 32 76 51 37 15 46 88 49 28 100 9 29 69 87 27 54 68 23 80 39 22 86 2 58 84 17 18 89 13 38 38 28 19 69 10 53 94 49 16 51 52 18 47 59 67 39 23 41 84 70 40 85 86 20 1 77 100 12 76 79 53 88 20 85 12 19 89 72 48 86 97 54 1 39 62 94 51 50 50 8 99 31 24 87 71 84 98 56 35 6 83 27 65 78 50 59 17 70 51 35 12 48 30 93 43 20 5 79 1 88 25 46 72 81 29 27 84 97 27 94 90 62 28 61 97 78 22 66 89 37 37 26 98 27 19 99 51 36 99 61 1 49 45 79 63 78 8 23 48 29 7 93 3 15 54 14 15 48 39 96 65 27 79 35 16 29 7 43 16 26 48 51 40 82 49 14 3 48 8 25 41 62 73 45 83 80 7 51 9 83 53 18 27 81 20 16 45 7 82 56 18 41 32 3 91 92 24 6 99 6 100 42 88 97 75 77 76 98 32 43 3 28 29 62 9 6 53 34 96 32 49 57 34 78 10 45 76 88 96 48 36 2 53 18 49 18 20 38 47 69 75 60 89 82 16 48 83 13 35 55 40 17 43 73 89 30 49 1 17 53 76 99 44 88 52 78 21 45 58 50 85 55 68 100 73 95 84 52 90 80 35 28 11 77 45 54 77 100 20 52 13 29 58 2 69 41 98 97 51 96 17 10 66 80 16 59 32 94 93 73 30 7 6 55 73 54 55 69 14 99 5 37 91 2 99 47 6 29 84 6 100 52 72 77 68 91 40 4 56 24 40 52 15 2 23 33 99 46 98 63 60 17 51 29 67 67 96 75 61 3 53 5 12 35 97 86 97 92 82 66 85 70 35 3 3 78 26
category:0 25 30 35 45 50 55 65

/Take outer product, get a matrix where each row tells you whether a given person is older than 0 years, older than 25 years, etc.

agesSubset:10#ages
category</:agesSubset

/Take plus over to get the total number of people older than 0 years, the total older than 25 years, etc

(+/)category</:ages

/However, note that adding up booleans gets you an `int` type instead of `long`. To force the sums to `long`, provide an initial value of `0` to plus over.

counts:0+/category</:ages

/We're not there yet, because we don't care about the total number of people older than 25, we really want to know the number of people older than 25 but younger than 30, i.e. the size of each age bucket. To do that, we can subtract each count by the count that comes after it.

counts-(1_counts,0)

/An alternate solution is to use the built-in deltas function

neg 1_deltas counts,0
