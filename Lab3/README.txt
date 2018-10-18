Kevin Le, kevle@ucsc.edu, Lab 3, Decimal Converter, Due: Nov 1st, CMPE 02E, TA: Nick Junius

Title: Lab 3

Purpose: The purpose of this lab is to create a decimal converter in the MIPS programming language. It is also for us to better learn this
language and practice good practices in a low level language like this.

Methods: 

First of all, I needed to make sure my text prints out correctly. The base file included all i needed to print out the welcome message. I added onto this by including a lw operator and li with a syscall to print out "Input Number:".

Second, I needed to write code to check whether or not my user input is negative or positive. In order to do this, I used lb to read the characters in ($s0) - which is where the user input comes from. I stored that into a register - $s6. From there I used a bne to check if $s6's first character is not equal to 45. 45 is the ASCII value for "-" which is what you put in front of a number if it is negative. For example, "-1" = negative one. If it is not equal, then it goes to my init_loop which is the beginning of starting my loop to iterate through the string (user input). 

However, if my user input does equal to 45, I have to add 1 to a new register - $s3 which will be used later in my development to act as a conditional to determine whether or not I will be initiating inversion or not. I also add 1 to $s0 in order to increment the address to read the next character.

My first loop is used to iterate through the string and convert it to a decimal. To sum it up, I initialized a register s6 to be 0. s6 is acting as my sum storage. I stored user input into s4 and had a conditional to determine whether or not s4 was a zero. If it was, it would exit. If not, it would continue on. From there I subtracted the ascii value of 48 (which is 0 in decimal) from s4 in order to convert it from string to number. After that I multiplied s6 by t1 = 10 to get my respective tens place if needed. After that, I add it to smaller non tens place digits in order to get my final number. From there I incremented my address and jumped back to the beginning of the loop just in case my input number is several digits or longer. 

My next loop is about inversion and binary conversion. 

I used a bne to make sure s3 does not have a 1 in it. If it doesn't, then i would skip to the starting inversion portion of the code. Assuming our input number has a "-", i used the not operator to invert the whole input and store it back into the same register, essentially overwriting itself. I used add to add 1 to that inverted number to complete 2SC.

I created a new register $s2 and initialized it with 32 bits. I had a series of shifts and and operations in order to figure out the binary value of my input numbers. It checked whether or not my input number's binary had a 1 or 0 in each position it checked. If it had a 1, print 1 if it had a 0, print 0. 

Results: 
My program worked well as it's able to take in any positive and negative input and produce the binary equivalent. Using a combination of beq, beqz, lb, li, nop, mul, add, addi, j, la, sll, syscall, srl, and other operations was instrumental in making this program work.

Analysis:
I should have wrote code to check whether or not the number is negative or positive in the beginning before I started my loops. I didn't do this earlier but later in the stage. I should have planned my program out using a combination of algorithms, flowcharts, and pseudocode in order to complete this assignment faster and more effectively.

Q1: Discuss the algorithm(s) you designed. Were there any issues in implementing them?
A: I used an iterating algorithm in order to iterate through my user input and convert each character into a number. The iteration algorithm was important for me to move onto the next address in memory. Also, the algorithm to check if my input was negative and possitive was important. I had many issues implementing this. For example, in the beginning, I would input a -1 and it can spit out binary but the input would show as -29 so figuring out why the printed input was incorrect was important. I ended up moving my print statement for the input up before my first loop started. Also, the algorithm to compare a 32-bit register and my input was hard to implement. Conceptually it made sense but putting it into code was more difficult. The beqz operator was important in helping me decide whether or not a number in a certain position was a 1 or 0 and based on that I could jump to specific parts of my code to either print out a 1 or 0.

Q2: Discuss any assembly language techniques you developed or discovered.
A: I learned how you should start using labels in order to navigate through the code. Using label names like init_loop, Get_next_digit, and is_null helped me figure out where I am in my code and whether or not I should jump back to it if needed. It was incredibly more helpful than commenting because I know what that section of the code does but also i have the ability to loop or jump back whereas a comment does not do anything. 

Q3: Several pseudo-ops were needed to complete this lab. Compare the code written with the
assembled code and look at what the assembler did. How many more lines of assembly were
written? My code written amounted to around 70 lines. The assembled code amounted to around 51 lines. So the assembled code was far less than the written amount by around 19 lines. 