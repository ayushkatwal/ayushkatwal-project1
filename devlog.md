3/28	1:18 AM

I am starting my work on the project and have done brainstorming on the order of work I am going to do. To start with: for this session I will use the mode.rkt file as a way to get my project to run in batch mode or interactive mode. I will also add a function to tokenize input string into a list of tokens as this will help read input. 



3/28    2:11 AM

I put the function to determine batch or interactive mode as my first step. I then wrote a function to tokenize input strings into a list of tokens as I said I would. I was feeling a boost of energy so I decided to write a function that will get history values with the list reversed in order to have the first thing in history be referenced by $1. I also made sure to check for invalid input by having an error show up when the user inputs a history value that does not exist yet. For the end of the night I decided to start on the biggest function I would have, which is the evaluate function that will handle reading all the input and evaluating it.



3/28	10:07 AM

I am planning to finish the function for evaluate before noon so I can handle all cases of possible input. I need to make sure I can handle addition, division, multiplication, and history ($) input. Subtraction will be handled by adding a negative number. I am not sure how I can unit test each function so I will have to leave that at the end and debug any errors.


3/28    12:07 PM 

I have finished the evaluate function which can now handle all cases of possible input. When input is -, the program will negate a number. When the input has + it will add the next two numbers, when it is * it will multiply the next two integers. When it is / it will divide the next two integers while also making sure that we are not dividing by 0. We also reference the history-value function I created during the first session and check to make sure the history value exists. Lastly, if a user inputs something other than a number or one of (+ - / $n *) then an error message will be displayed.


3/28	2:14 PM

I am nearing completion of writing the initial code, but will still need to debug. During this session I will write the main function of the code that will handle looping for user input and calling the evaluate function. I plan to finish this in the session but may have to end the session early. 


3/28	3:20 PM

I had to wrap up the session, but after about 30 minutes of thinking through the logic for how to do main I finally got started with writing it. I wrote the prompt for interactive mode, got the reading of user input done, and when the user enters quit the program will terminate. I also added evaluating input using error handlers in this session. I am nearing completion of the code and plan to do so next session. In addition I also made sure to add comments explaining what certain parts of my code do so other users will be able to analyze it easier. It also helps me go through my thinking process.


3/28	5:10 PM

I will finish the main function and handle all the debugging in this session, I believe everything should work fine with the only minor errors being missing ')'. Dr. Racket identifies these errors while I code so it will be an easy fix. I have prepared test input to verify I have working code. + 2 5 should result in 1: 7.0, - 5 4 should result in Error: Invalid Expression, 5 should result in 2: 5.0, - 4 should result in 3: -4.0, * 9 2  should result in 4: 18.0, / 9 3 should result in 5: 3.0, / 9 0 should result in Error: Invalid Expression, / 0 9 should result in 6: 0.0, $2 should result in 7: 5.0, $23 should result in Error: Invalid Expression, + * 2 $1 + $2 1 should result in 8: 20.0, + sfm3 1 should result in Error: Invalid Expression, + - 4 1 should result in 9: -3.0, + 4 - 1  should result in 10: 3.0, quit will terminate the program. In order the test cases cover addition, error for subtraction (instead we add negative numbers), inputting only a number, inputting only a negated number, multiplication, division, error for dividing by zero, dividing zero by another number, $2 getting the history value of second valid output, $23 error for trying to reference a non-existent history data, evaluating a complex prefix equation, error for unaccepted tokens, adding a positive number to a negative number, adding a negative number to a positive number, and lastly quitting the program. I will test these inputs after coding in command line both in interactive mode and batch mode. The only difference is that interactive mode will prompt me with "Enter prefix notation:" and batch mode will have no prompt but still output and give error messages.


3/28	6:55 PM

I finished writing the main function and the code is complete. I ran the code with minimal errors due to the main function I wrote. I tweaked the code a little and was able to start on test cases. All the test cases I provided in the previous devlog entry were used and the code I wrote produced the desired results. I will wrap up this session and come back to it at the end to see if there is anything else I can do before submission.


3/28	8:05 PM

For my final session I will write a README.md file to explain how to run the code and will be prepared to make final submissions. I will also try to make the racket code a little more readable as personally I feel like it is hard to read. Once these two things are done I will submit the project.