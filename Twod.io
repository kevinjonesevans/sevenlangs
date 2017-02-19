Twod := Object clone
Twod values := 0
Twod dim := method(x,y,
	Twod values = List setSize(x) map(x, list() setSize(y))
)
Twod get := method(x,y,
	Twod values at(x) at(y)
)
Twod set := method(x,y,value,
	Twod values at(y) atPut(x,value)
)

myTwod := Twod clone
myTwod dim(2,2)
myTwod values println
myTwod set(0,0,1)
myTwod set(0,1,2)
myTwod set(1,0,3)
myTwod set(1,1,4)
myTwod values println
myTwod get(0,0) println
myTwod get(1,1) println

Twod transpose := method(
	Twod values reverseInPlace
	for(i, 0, Twod values size-1, 1,
		Twod values at(i) reverseInPlace
	)
)

myTwod transpose
myTwod values println