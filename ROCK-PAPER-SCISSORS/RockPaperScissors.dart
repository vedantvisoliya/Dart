import "dart:io";
import 'dart:math';

String botInput(){
  Random random = Random();
  int randomNum = 1 + random.nextInt(3);
  if(randomNum == 1){
    return "ROCK";
  }
  else if(randomNum == 2){
    return "PAPER";
  }
  else if(randomNum == 3){
    return "SCISSORS";
  }
  return "";
}

String userInput()
{
  bool exit = false;
  String? choice = "";
  do{
    stdout.write("Enter your choice: ");
    choice = (stdin.readLineSync()!).toLowerCase();
    switch(choice){
      case "r":
        exit = true;
        return "ROCK";
      case "p":
        exit = true;
        return "PAPER";
      case "s":
        exit = true;
        return "SCISSORS";
      default:
        print("Error: Invalid Input");
        continue;
    }
  }while(exit == false);
  return "";
}
int? winChecker(String user_choice, String bot_choice, int userScore, int botScore){
  // 0 - user;
  // 1 - bot;
  if(user_choice == bot_choice){
    print("         ----------ROUND DRAW----------");
    print("         USER SCORE        BOT SCORE");
    return null;
  } 
  else if(user_choice == "ROCK" && bot_choice == "PAPER"){
    print("         ------BOT WON THIS ROUND------");
    return 1; 
  }
  else if(user_choice == "ROCK" && bot_choice == "SCISSORS"){
    print("         ------USER WON THIS ROUND------");
    return 0;
  }
  else if(user_choice == "PAPER" && bot_choice == "ROCK"){
    print("         ------USER WON THIS ROUND------");
    return 0;
  }
  else if(user_choice == "PAPER" && bot_choice == "SCISSORS"){
    print("         ------BOT WON THIS ROUND------");
    return 1;
  }
  else if(user_choice == "SCISSORS" && bot_choice == "ROCK"){
    print("         ------BOT WON THIS ROUND------");
    return 1;
  }
  else if(user_choice == "SCISSORS" && bot_choice == "PAPER"){ 
    print("         ------USER WON THIS ROUND------");
    return 0;
  }
  return null;
}

void main()
{
  print(''' 
        The Game of Rock Paper Scissors
        -------------------------------
        _____________RULES_____________
        1. Rock can beat Scissors but not Paper.
        2. Paper can beat Rock but not Scissors.
        3. Scissors can beat Paper but not Rock.
        4. This game consists of 5 ROUNDS.
        -------------------------------
        type: r/R for ROCK
              p/P for PAPER
              s/S for SCISSORS
        _______________________________
        created by: Vedant Kumar
        _______________________________
        ''');
  // variables
  // int rounds = 1;
  int userScore = 0;
  int botScore = 0;
  int? temp;
  String userChoice = "";
  String botChoice = "";
  
  // game loop started
  print("GAME STARTED...");
  for(int i = 1; i <= 5; i++){
    print('''
          _____________________________
          ----------ROUND $i-----------
          _____________________________
          ''');
    userChoice = userInput();
    botChoice = botInput();
    
    print('''
          USER    vs    BOT
          $userChoice          $botChoice 
          ''');
    temp = winChecker(userChoice, botChoice, userScore, botScore);
    if(temp == 0){
      userScore++;
    }
    else if(temp == 1){
      botScore++;
    }   
    print("           $userScore                 $botScore");
  }
  // game loop ended

  // win check

  if(userScore > botScore){
    print("         ______USER WON THE MATCH______");
  }
  else if(userScore < botScore){
    print("         ______BOT WON THE MATCH______");
  }
  else if(userScore == botScore){
    print("         __________MATCH DRAW_________");
  }
  else{
    print("Game Exited Succesfully");
  }
}