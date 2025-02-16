import 'dart:io';
import 'dart:math';

int? getPasswordLength()
{
  int passwordLength;
  String? userInput;

  while(true) 
  {
    stdout.write("Enter the password length: ");
    userInput = stdin.readLineSync();

    if(userInput == "exit")
    {
      return null;
    }
    else if(userInput != "")
    {
      passwordLength = int.parse(userInput!);
      if(passwordLength <= 0)
      {
        print("Error: Invalid Input");
        continue;
      }
      else if(passwordLength < 8)
      {
        print("Error: password must contain 8 characters");
        continue;
      }
      return passwordLength;
    }
    else
    {
      print("Error: Invalid Input");
      continue;
    }
  }
}

String? userSuggestion(int passwordLength)
{
  String? userInput;
  stdout.write('''
              Do you want to add your suggestion
              to the password.
              if yes type [y]
              else no type [n]              
              ''');
  stdout.write(": ");
   while(true)
   {
      userInput = stdin.readLineSync();
      if(userInput == null){
        return null;
      }
      else if(userInput != "")
      {
        if(userInput.toLowerCase() == "y")
        {
          stdout.write("type: ");
          userInput = stdin.readLineSync();
          if(userInput == null)
          {
            return null;
          }
          else if(userInput != "")
          {
            if(userInput.length >= passwordLength)
            {
              print("Error: Suggestions exceeds or equal the password lenght");
              print('''
                    Try Again
                    type [y] to continue
                    else [n]''');
              stdout.write(": ");
              continue;
            }
              return userInput;
          }
          else if(userInput == "exit")
          {
            break;
          }
          else
          {
            print('''
                  Try Again
                  type [y] to continue
                  else [n]''');
            stdout.write(": ");
            continue;
          }
        }
        else if(userInput.toLowerCase() == "n")
        {
          break;
        }
      }
      else
      {
        stdout.write("try again: ");
        continue;
      }
   }
   return null;
}

String? genRandPass(int passwordLength)
{
  String characters = "abcdefghijklmonpqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890!@#\$%^&*";
  String password = ""; 
  Random random = Random();
  // print(password[8]);
  // return "";
  for (int i = 1; i <= passwordLength; i++)
  {
    int randomNum = random.nextInt(characters.length);
    password += characters[randomNum];
  }
  return password;
}
void main()
{
  int? passwordLength;
  String? passSuggestion = "";
  String genPassword = "";
  String password = "";
  print('''
_______________________________
        PASSWORD GENRATOR
                    by vedant
-------------------------------
        ''');
  passwordLength = getPasswordLength();
  passSuggestion = userSuggestion(passwordLength!);

  if(passSuggestion != null)
  {
    
    passwordLength = passwordLength - passSuggestion.length;
    genPassword = genRandPass(passwordLength)!;
    password = passSuggestion + genPassword;
  } 
  else
  {
    genPassword = genRandPass(passwordLength)!;
    password = genPassword;
  }
  print("password genrated: " + password);
}