# Guess-Number-Game
## 1.When the page initially loads, the application should present a user prompt asking for the player’s name. This prompt should be accompanied by a text box.
  a. The player’s name is mandatory and therefore cannot be blank – it can contain any characters but must not be blank.
## 2. After the name is entered, the application shall hide the name prompt and will now prompt the user (by name) to enter the maximum guess number
  a. The application will only allow the user to enter an integer number and will ensure the value greater than 1.
  
  b. If any input other than this is given, then an informative error message must be presented
## 3. Your Hi-Lo application must create a random integer between 1 and the maximum guess number
## 4. At this point in the application, the maximum guess number prompt should be hidden as you enter the main runtime (guessing) UI of the application
## 5. The following must be components of the main runtime UI:
  a. A prompt asking the user (by name) to guess a number. This prompt must consist of a textbox to allow the user to enter a new guess at the random number. [NOTE: Do not use the JavaScript prompt() function]
  b. A button to submit the guess labeled as “Make this Guess”
  
  c. A message that informs the user about their allowable guessing range
  
    * For example, let’s say the user enters 10 as their maximum number – your initial message would read “Your allowable guessing range is any value between 1 and 10.”
    * If the random number your code generated was 7 and the user guesses 5, then after submitting their guess the message would change to “Your allowable guessing range is any value between 6 and 10”
    * This message must be present in the resultant HTML – do not use the JavaScript alert() function or any other pop-up messaging scheme
  d. If the user happens to enter a number outside of the allowable range – your logic needs to inform them of this and also simply restate your allowable guessing range message
    * For example, let’s say the allowable guessing range is between 6 and 10 and the user enters the value 44 or -10 … since they are number values, it’s allowed – tell them it is outside of the allowable range and simply remind them of the guessing range
  e. During the game, if the user enters anything but a number, I expect your Hi-Lo game to remind the user that they need to enter a number – so display some kind of error message to that effect as well as the allowable guessing range message
  f. When the user’s guess is correct, change the background colour of the page and show a message on the screen saying “You Win!! You guessed the number!!”
  
    * There should be no remnants of the main guessing prompt and/or messages
    * At this point, show a “Play Again” button and reset your page to do it again
    * Only this time you don’t need to prompt the user for their name – but you should prompt them for a new maximum number.
## 6. Make sure that all data entered is validated for proper data type and in some cases proper data ranges/values
  a. Remember that the objective of the code is to create a workable Hi-Lo game
  
  b. Also remember that giving the user timely feedback is a mandated usability factor
## 7. The application should also only ever have one user prompt visible on the screen
