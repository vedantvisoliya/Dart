import "dart:io";
import "dart:math";

int generateRandNum()
{
  Random random = Random();
  int randomNum = 1 + random.nextInt(100);
  return randomNum;
}

int? getUserInput()
{
  int userInput;
  bool exit = false;

  while(exit == false)
  {   
    stdout.write("Enter the number: ");
    String? tempUserInput = stdin.readLineSync();
    if(tempUserInput == "exit")
    {
      return null;
    }
    else if(tempUserInput != "")
    {
      userInput = int.parse(tempUserInput!);
      return userInput;
    }
    else{
      print("Error: Invalid Input");
    }
  }
  return 0;
}

void main()
{
  int number = generateRandNum();
  int? userNumber;
  print('''
        WELCOME, To Number Guessing Game.

        You will be given 10 chances to guess
        a number between 1 to 100.
        Guess the Number.
        
        To exit the game type 'exit'
        ''');
  for(int i = 1; i <= 10; i++){
    userNumber = getUserInput();
    if(userNumber == number)
    {
      print('''
            Congratulations, you guessed the number.
            The correct number is $number.
            You guessed the number in ${i} chances.
            ''');
      break;
    }
    else if (userNumber == null){
      print("Exited successfully");
      break;
    }
    else if(userNumber > number)
    {
      print("You are too HIGH.");
      print("Remaining chances: ${10-i}");
    }
    else if(userNumber < number)
    {
      print("You are too LOW");      
      print("Remaining chances: ${10-i}");
    }

    if(i == 10)
    {
      print("Remaining chances: ${10-i}");
      print("Sorry, your all chances are finished.");
      print("Try Again.");
    }
  }
}