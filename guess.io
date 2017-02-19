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