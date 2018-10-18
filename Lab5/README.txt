Kevin Le, kevle@ucsc.edu, Lab 5, Vigenere cipher, Due: Nov 26th, CMPE 02E, TA: Nick Junius

Title: Lab 5

Purpose: The purpose of this lab is to create a program to encrypt and decrypt a user-supplied string. My code must read the key and clear text, encrypt it, decrypt it, and then display the encrypted and plaintext versions of the string. 

Methods: 

In my methods to complete this program, I had to make sure that I was able to get the key and input address of each first characters. I used lw $s0, 0($a1) in order to get my key address' first char and lw $s2, 4($a1) to get my input address' first char. This was very important because I was then able to use la $t1 and $t2 with Key_str and Clear_str (arrays) to link arbitrary registers with my two arrays. 

From here, I filled up my key and input arrays with the same values I got from program args. I had to use 2 pointers for this section (one for key and one for input). I printed out these values and continued onward to my Encode section of the program.

In Encode, I brought up the values of my key and input from the 2 arrays and loaded their ascii equivalent values into some registers. I did some math (MIPS equivalent to cipher.c) and stored the resulting values into another array which will be used to print out the encrypted value. I had to use 3 pointers in this section - one for prog arg, one for .data destination, and one for the key. I made sure to increment through my Key, Clear text, and encoded string arrays in order to grab my values for math and store them into a new array.

I made sure to write some code to check for my key hitting null - since I'd want to loop back. My key would usually be shorter than my input so it's important to check for this. 

For decode, I do the same thing for encode except I use different registers that weren't originally used. In regards to the math, I replaced addition with subtraction and rem with remu to take care of negative values. 

Results: 
My program worked well as it's able to take in a key and input to produce the 4 lines of code i needed. It was very important for me to figure out the concepts of pointers in order to know where exactly my values were stored in order to debug easier. 

Analysis:
I should learn how to use the .data data segment in the execute tab of Mars better. It was very helpful for me to debug my program once Max L. showed me. Again, I spent a lot of time to plan and create a very detailed flow chat. Also, consulting with different TA's saved my program from ruin. My MSI tutor Andy Kang told me to check for the wrong thing so I optimized my program to check for _ instead of spaces. Max L. told me exactly what to do and how Andy was wrong so it was vital for me to cross check my program with multiple TA's.

Q1: Discuss the encode/decode algorithms. What similarities are there between them?
A: The encode and decode algorithms were relatively straightforward. You have a key and an input which you use together to add the ASCII values of each character (of key and input) together in order to generate a new ascii value which is the encrypted value. You loop through the key's character values until you hit the end of the input, from which you will store the new encrypted value into some array. The encode and decode algorithms were very similar. For encode, you had to add characters of key and input, put it into a new register and then "rem" that by 128 (value of all possible characters in the ASCII table). For decode, you almost do the same thing, except instead of add you subtract. Instead of "rem", I used "remu" to take care of possible negative values from the division part. 

Q2: Discuss the functions you made and what you were required to save.
A: I had several main functions and minor functions in this program. In my Initialize function, I used lw $s0, 0($a1) in order to get my key address' first char and lw $s2, 4($a1) to get my input address' first char. This was very important because I was then able to use la $t1 and $t2 with Key_str and Clear_str (arrays) to link arbitrary registers with my two arrays. 

In Get_key, I used a pointer to fill up register $t0 with contents of memory that $s0 points to (key address). I checked for null and put the contents of $t0 into the byte pointed to by $t1. I incremented my $t1 and $s0 to go through the program arg. string and then jumped back to Get_key in order to go through and store the new values in my key array.

In Get_input, I pretty much did the same thing like I did for Get_key except I am storing values into an input array. 

In Print_first, I printed out the values computed my Get_key and Get_input section ---- Key_str = array containing key AND Clear_str = array containing input.

In Pre_encode, I brought up Key_str, Clear_str, and Encoded_str and resetted their initial index to point at 0. Since I have these new values of key in my key array and input in my input array, I can now start on doing the math to encrypt and decrypt.

In Encode, I loaded the first value of my key and input arrays and added them together. In this process, ASCII addition gets done so I get some new arbitrary value which is essentially the encrypted value. After adding these two values together, I stored them into a register and used the rem operation to find the remainder of this register after dividing by 128 (value of all ASCII values from the table). After getting that new encrypted value, I stored it in a new array to print out later. I used a for loop in this case in order to iterate through my key and input array to encrypt all values and also looping again through the key array since my test cases had keys that are shorter than inputs. 

In Check, I checked if my key hit a null value. If so, loop back to the beginning. As said above, "I used a for loop in this case in order to iterate through my key and input array to encrypt all values and also looping again through the key array since my test cases had keys that are shorter than inputs."

In Pre_decode, I printed out the values of my encrypted array (Encoded_str). I brought up my stored arrays: Encoded_str, Key_str, and Decoded_str and stored their initial values into new registers. In this function, I did the same math like I did for Encode with the exception of using new registers and using subtraction and remu (taking care of negatives). 

In Check1, I checked whether or not the key array reached null. If so, loop back to the beginning.

In Print_decrypted, I printed out the decrypted value.

Then we exit the program.