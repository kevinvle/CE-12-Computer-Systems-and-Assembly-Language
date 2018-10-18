# Kevin Le, kevle@ucsc.edu, Lab 4, Prime Finder, Due: Nov 1st, CMPE 02E, TA: Nick Junius
.text
main:		
        #------------------------------------------------------------------------
	#la    	 $a0, input_msg 	# Print asking for input
	#li       $v0, 4 		
	#syscall	
	#lw	 $a0, ($a1)		# Print out label
	#li	 $v0, 4
	#syscall	
	#------------------------------------------------------------------------
	#li 	 $s2, 0	 	# s2 = j or next number in line by incrementing
	#li 	 $s1, 0	 	# s1 = i or divisor incrementing
	#li 	 $s3, 0		# s3 = remainder
	#li 	 $s4, 0		# s4 = n or user input
	li 	 $v0, 5		# Takes in input and converts from string to int and puts it into v0 put from string to int and store in v0
	syscall
	add	 $s4, $s4, $v0	# Store user input into s4
init_loop:
	#lb	 $s4, ($a0)		# Store user input into s4
	li 	 $s2, 2 		# Set j = 2
	beq	 $s1, $s0, Exit		# Check if j == n then exit
	rem 	 $s3, $s2, $s1 		# Set $s3 to contain the remainder of s2 % s1 or j % i
	beqz 	 $s3, notPrime		# if j % i == 0
notPrime: 
	j 	 Exit
	addi	 $s1, $s1, 1		# Increment i 
	beq 	 $s1, $s2, isPrime      # if j == i, then j is prime.
isPrime: 
	add	 $a1, $a1, $s0 		# Load contents of s0 into a1 to print out the prime number
	lw	 $a0, ($a1)		# Print out label
	li	 $v0, 4
	syscall	
	la    	 $a2, prime_msg 	# Print that it is prime
	li       $v0, 11		
	syscall	
	
	add	 $s2, $s2, 1 	 	# Increment j up one. j++
	j 	 init_loop	 	# Loop back to find if the number is prime or not
	
	
Exit:
	li	 $v0, 11 # 10 is the exit syscall.
	syscall

	
# Data for the program:
.data
notprime_msg: .asciiz " is not prime"
prime_msg: .asciiz " IT IS PRIME"
input_msg: .asciiz " Input Number:"
output_msg: .asciiz "\n Output Number:"
str2:  .asciiz "You wrote:"
null: .word 0
stored: .word
# end hello.asm
