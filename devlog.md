3/28	1:18 AM
I am starting my work on the project and have done brainstorming on the order of work I am going to do. To start with: for this session I will use the mode.rkt file as a way to get my project to run in batch mode or interactive mode. I will also add a function to tokenize input string into a list of tokens as this will help read input. 

3/28    2:11 AM
I put the function to determine batch or interactive mode as my first step. I then wrote a function to tokenize input strings into a list of tokens as I said I would. I was feeling a boost of energy so I decided to write a function that will get history values with the list reversed in order to have the first thing in history be referenced by $1. I also made sure to check for invalid input by having an error show up when the user inputs a history value that does not exist yet. For the end of the night I decided to start on the biggest function I would have, which is the evaluate function that will handle reading all the input and evaluating it.

3/28	10:07 AM
I am planning to finish the function for evaluate before noon so I can handle all cases of possible input. I need to make sure I can handle addition, division, multiplication, and history ($) input. Subtraction will be handled by adding a negative number. I am not sure how I can unit test each function so I will have to leave that at the end and debug any errors.

