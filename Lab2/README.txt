Kevin Le, kevle@ucsc.edu, Lab 2, Adding and Subtracting, Due: October 22md, CMPE 02E, TA: Nick Junius

Title:
Lab 2

Purpose: 
The purpose of this lab is to learn how to add and subtract using digital logic and circuits work with the concepts of truth tables from Bit adders, knowledge of multiplexers, and registers. 

Methods:
In order to create my circuit, I needed to make sure I have a keypad. After I select a press a key from my keypad, it would go to my inverter part where I have a multiplexer circuit set up. I also have a switch in the beginning that lets the user select whether or not he/she wants to add or sub. The nice thing about the multiplexer is it allows you to connect a selector, in this case, a receiver from the sender which is connected to my Add/Sub switch. 

So based on which position my switch is at, my multiplexer will output a 1 or 0. My 1 represents an inverted keypad which is needed for us to do subtraction. Whereas the 0 represents a normal keypad - used for adding. After my multiplexer receives the positive or negative value from my keypad, I'm able to send that value forward to my first 1 bit adder. At the very beginning for my one bit adder, my A value would be whatever is coming from the keypad. My B value will be 0 because I have not gone through the 1 bit adder yet. My Cin value would be a receiver connected to my Add/Sub Sender. 

After my one bit adder goes through the "truth table" calculations, it outputs a Carry and Sum. My Sum gets inputted into my register which is made of a flip flop. My flip flop has a reset and store data button in order for me to decide whether or not I want to reset the whole program or store the number value I just pressed. Once I store my data, my value gets stored in the flip flop and that value sends a signal sender back to my first 1 bit adder which replaces the original B (originally 0 because no value came from in) and goes through the whole circuit and ends up with me having a new carry value (which was originally nothing). From there my Cout value goes into the Cin input of my 2nd 1 bit adder and the whole process repeats until I reach my very last 1 bit adder. 


Results:
6 bit addition works well on this circuit as well as subtraction when I have to do 2SC which inverts my number value from 1 to 0 or 0 to 1 and add a 1 (which comes in the value of a 1 being inputted to my first Cin input in my first 1 bit adder). All the values from Sum and B get shown separately on two 7 segment LED's to show my output of adder and running sum values.  

I have 6 one bit adders, registers, and mux's since I'm dealing with 6 bit adder addition and subtraction. Even if my number input has 4 bits, I need 2 additional 0's which fulfill my goal of having a 6 bit number.  

Analysis:
I learned a whole lot on building a basic calculator from this lab. I never knew you could connect a bunch of adders (traditionally shown in the form of truth tables) together to create something like this. What worked well for me after going to numerous MSI, Office Hours, and TA Lab sessions was understanding visually at a high level how this calculator worked. I didn't know how the adders connected to each other in the beginning. I learned that my 1st adder's Cout could be connected to a 2nd one's Cin. Connecting senders and receivers from the adder to register made sense since I wanted to store a value which would be my sum. Learning about how flip flops work was great too because they acted like if statements. If 1 was given in the selector then the 1's value gate would open in the flip flop and whatever was going to be initiatied in the input would occur. Originally I had switches on my adder page but learned that I could make things less complicated visually by replacing them with senders and receivers. Although I didn't have much actions I took to debug the program, I believe it all lies in the planning stage. I had to go to a lot of tutoring sessions before I was able to plan everything out and power through. One small thing like attaching my keypad receivers to a 7 segment display 

Q1: What happens when you subtract a larger number from a smaller number?  Does the result make
sense? 
A: It does not work for a 6 bit number because you will run out of bits to represent the number after subtraction. You can't represent that in MML. For example 1111101-101101=-010000	

Q2: What happens when you add two numbers that won’t fit in 6 bits?
A: If our answer was 7 bits from adding two 6 bit numbers, overflow would be ignored. Since a program would require our answer to be 6 bits, an overflow would give us the wrong answer by ignoring the far left bit. If we did 111111 + 111111, it would = 1111110 which has an extra 7. Due to overflow it would become 111110 which is the wrong answer.