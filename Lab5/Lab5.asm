# Kevin Le, kevle@ucsc.edu, Lab 5, Vigenere Cipher, Due: Nov 26th, CMPE 02E, TA: Nick Junius
.text
main:			
	
Clear:
	li 	$t0, 0 			# Cleaing all the registers. This is definitely needed if I decide to loop my program back to start after finishing. Keeping it here just in case. 
	li	$t1, 0
	li	$t2, 0
	li	$t3, 0
	li	$t4, 0
	li	$t5, 0
	li	$t6, 0
	li	$t7, 0
	li	$s0 ,0
	li	$s1, 0
	li	$s2, 0
	li	$s3, 0
	li	$s4, 0
	li	$s5, 0
	li	$s6, 0
	li	$s7, 0
	li	$t8, 0
	li	$t9, 0

Initialize:
	lw	$s0, 0($a1) 		# key address of first char // Instead of having move and lw we put everything into one line
	lw	$s2, 4($a1) 		# input address of first char  // Instead of having move and lw we put everything into one line
	la	$t1, Key_str 		# Put contents of t1 into Key_str
	la	$t2, Clear_str		# Put contents of t2 into Clear_str

Get_key:
	lb	$t0, ($s0)		# Fill up t0 with contents of memory that s0 points to
	beq	$t0, 0, Get_input	# Check for space (null)
	sb	$t0, ($t1)		# Contents of t0 gets placed into the byte pointed to by t1 // take t0 and send it along t1 arrow	
	addi	$t1, $t1, 1 		# Increment t1 to go through dest (.data) array
	addi	$s0, $s0, 1		# Increment s0 to go through program arg string
	j 	Get_key			# Loop to store key into Key_str

Get_input:				# PRETTY MUCH SAME THING AS Get_key
	lb	$t3, ($s2)		# Fill up t3 with contents of memory that s2 points to
	beq	$t3, 0, Print_first	# Check for space (null)
	sb	$t3, ($t2)		# Contents of t3 gets placed into the byte pointed to by t2 // take t3 and send it along t2 arrow	
	addi	$t2, $t2, 1 		# Increment t2 to go through dest (.data) array
	addi	$s2, $s2, 1		# Increment s2 to go through program arg string
	j 	Get_input		# Loop to store key into Clear_str

Print_first: 
	la	$a0, Given_key 		# print text "given key" 
	li	$v0, 4 		
	syscall	
	la	$a0, Key_str		# Print out our key from Key_str array
	li	$v0, 4
	syscall	
	la	$a0, Given_text 	# print text, "given text" 
	li	$v0, 4 		
	syscall	
	la	$a0, Clear_str		# Print out our key from Clear_str array
	li	$v0, 4
	syscall	
	
Pre_encode:
	la	$s4, Key_str		# Bring up Key_str and reset to initial index 0
	la	$s7, Clear_str		# Bring up Clear_str and reset to initial index 0
	la	$t4, Encoded_str	# Bring up Encoded_str and reset to initial index 0			
	la	$a0, Encoded_text 	# Print text "The encrypted text is:"
	li	$v0, 4 		
	syscall
	
Encode:					# Max Lich said "3 pointers - one for prog arg, one for .data dest, one for key"
	lb	$s5, ($s4)		# Loading char (ascii value) into s5 -- reps key
	beqz	$s5, Check 		# Check if key reaches null
	lb 	$s3, ($s7)		# Loading char (ascii value) into s3 -- reps input
	beqz	$s3, Pre_decode		# End loop early if input reaches null already
	add	$s6, $s5, $s3		# Add index[x] of key and input together
	rem	$t2, $s6, 128		# Mod stuff
	sb	$t2, 0($t4)		# Store into array ----- is t2 wrong?
	addi	$s4, $s4, 1		# Increment address of Key_str
	addi	$s7, $s7, 1		# Increment address of Clear_str
	addi	$t4, $t4, 1		# Increment address of Encoded_str 
	j	Encode

Check:
	la	$s4, Key_str		# If key reaches null, reset key so you would be adding its first char again
	j	Encode	
	
	
Pre_decode:
	la	$a0, Encoded_str	# Print out the encrypted values from Encoded_str array	
	li	$v0, 4
	syscall
	
	la	$t4, Encoded_str	# Bring up Encoded_str and reset to initial index 0
	la	$s3, Key_str		# Bring up Key_str and reset to initial index 0
	la	$t0, Decoded_str	# Bring up Decoded_str and reset to initial index 0
	
	la	$a0, Decoded_text 	# print text "The decoded text is:"
	li	$v0, 4 		
	syscall
	
Decode:
	lb	$s1, ($s3)		# Loading char (ascii value) into s5 -- reps KEY
	beqz	$s1, Check1 		# Check if key reaches null
	lb 	$t7, ($t4)		# Loading char (ascii value) into s3 -- reps ENCODED
	beqz	$t7, Print_decrypted	# End loop early if encoded value reaches null already
	sub	$t5, $t7, $s1		# Add index[x] of key and input together
	remu	$t3, $t5, 128		# Mod stuff
	sb	$t3, 0($t0)		# Store into array ----- is t2 wrong?
	addi	$s3, $s3, 1		# Increment address of Key_str
	addi	$t4, $t4, 1		# Increment address of Encoded_str
	addi	$t0, $t0, 1		# Increment address of Decoded_str 
	j	Decode
	
Check1:
	la	$s3, Key_str		# If key reaches null, reset key so you would be adding its first char again
	j	Decode	

Print_decrypted:
	la	$a0, Decoded_str	# Print out the encrypted values from Encoded_str array	
	li	$v0, 4
	syscall
	
# ------------------- Keeping below commented code just in case program needs a loop back to start ----------------

#Pre_end:

#	la	$t4, Encoded_str	# Bring up Encoded_str and reset to initial index 0
#	la	$s3, Key_str		# Bring up Key_str and reset to initial index 0
#	la	$t0, Decoded_str	# Bring up Decoded_str and reset to initial index 0
#	la	$s7, Clear_str		# Bring up Clear_str and reset to initial index 0
	
#Clear_loop:
	
#	sb 	$t4, $zero
#	addi	$t4, $t4, 1
#	lw	$t6, ($t4)
#	beq	$t5, $zero, exit
#	j Clear
	
exit: 	
	li	 $v0, 10 
	syscall
	
.data
Empty_str: 		.space 		 101 	
Clear_str: 		.space		 101 	
Key_str: 		.space		 101 	
Encoded_str: 		.space		 101 
Decoded_str: 		.space		 101 
Given_key: 		.asciiz		 "The given key is: "
Given_text: 		.asciiz 	"\nThe given text is: "
Encoded_text: 		.asciiz 	"\nThe encrypted text is: "
Decoded_text: 		.asciiz 	"\nThe decrypted text is: "
null: 			.word		 0
stored: 		.word




