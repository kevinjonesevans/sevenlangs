"1.) Write a program to calculate a fibonacci sequence, as a bonus, do it with recursion" println

fibLoop := method(x,
	last := 1
	previous := 1
	current := 1
	i := 3
	while(i < x, 
		current = last + previous
		last = previous
		previous = current
		current = last + previous
	;i = i + 1)
	current
)

fibLoop(4) println

fib := method(x,
	if(x != 0,
		if(x == 1 or x == 2,
			1,
			fib(x-2) + fib(x-1)
		),
		0
	)
)

fib(4) println


"2.) How would you change the / to return 0 if the denominator is zero" println

coreDiv := Number getSlot("/")
Number / = method(x,
	if(x == 0, 
		0,
		self coreDiv(x)
	)
)

writeln(9/0)
writeln(9/5)


"3.) Write a program to add up all of the numbers in a two dimensional array" println

mylist := list(list(1,2,3),list(4,5,6),list(7,8,9))

sum2d := method(2dlist,
	total := 0 
	actualList := mylist flatten
	actualList foreach(item, total = total + item)
	writeln("Total:",total)
)

mylist sum2d


"4.) Add a slot called myAverage to a list that computes the avergae of all the numbers in a list. What happens if there are no numbers in a list?" println

mylist = mylist flatten
mylist myAverage := method(
	mytotal := 0
	foreach(item,
		mytotal = mytotal + item
	)
	average := mytotal / self size
	writeln(average)
)
mylist myAverage

"5.) Write a prototype for a two-dimensional list. The dim(x,y) method should allocate a list of y lists that are x elements long, set(x,y,value) should set a value, and get(x,y) should return that value."


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

"6.) Bonus: Write a transpose method so that (new_matrix get(y,x)) == matrix get(x,y) on the original list." println

Twod transpose := method(
	Twod values reverseInPlace
	for(i, 0, Twod values size-1, 1,
		Twod values at(i) reverseInPlace
	)
)

myTwod transpose
myTwod values println

"7.) Write a matrix to a file, and read a matrix from a file." println

filename := "matrixdata"
myFile := File open(filename) 
for(i, 0, myTwod values size-1, 1,
	for(j, 0, myTwod values at(i) size-1, 1,
		myFile write(myTwod get(i,j),",")
	)
	myFile write("\n")
)
myFile close

File openForReading(filename) readToEnd()

"8.) Write a program that gives you ten tries to guess a random number from 1-100. If you would like, give a hint of 'hotter' or 'colder' after the first guess." println

tries := 10
magic := Random value(1,10) round
guess := nil

while(tries > 0 and guess != magic,
	writeln("Guess the number I am thinking of...(1-10):")
	guess := File standardInput() readLine() asNumber
	if(guess == magic,
		# true
		writeln("You guessed correctly! Lucky you!")
		exit(),
		# false
		tries = tries - 1
		writeln("Try again. You have ", tries, " attempts remaining...")
	)
)





