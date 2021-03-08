# Guess-Number-Game
## 1.When the page initially loads, the application present a user prompt asking for the player’s name. 
  a. The player’s name is mandatory and cannot be blank – it can contain any characters but must not be blank.
## 2. After the name is entered, the application shall hide the name prompt and will now prompt the user (by name) to enter the maximum guess number
  a. The application will only allow the user to enter an integer number and will ensure the value greater than 1.
  
  b. If any input other than this is given, then an informative error message be presented
## 3. The Hi-Lo application create a random integer between 1 and the maximum guess number
## 4. A prompt asking the user (by name) to guess a number  
    * For example, let’s say the user enters 10 as their maximum number – your initial message would read “Your allowable guessing range is any value between 1 and 10.”
    * If the random number your code generated was 7 and the user guesses 5, then after submitting their guess the message would change to “Your allowable guessing range is any       value between 6 and 10”
    * If the user happens to enter a number outside of the allowable range – inform them of this and also simply restate your allowable guessing range message  
    * For example, let’s say the allowable guessing range is between 6 and 10 and the user enters the value 44 or -10 … since they are number values, it’s allowed – tell them it       is outside of the allowable range and simply remind them of the guessing range
    * During the game, if the user enters anything but a number, The Hi-Lo game to remind the user that they need to enter a number 
## 5. When the user’s guess is correct, change the background colour of the page and show a message on the screen saying “You Win!! You guessed the number!!”  
    * At this point, show a “Play Again” button and reset your page to do it again
