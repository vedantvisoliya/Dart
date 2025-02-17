import 'dart:io';

String? continueServices()
{
  String yesOrNo;
  while(true)
  {
    print('''Do you want to continue the service
             [y] yes
             [n] no''');
    stdout.write(": ");
    yesOrNo = stdin.readLineSync()!;
    if(yesOrNo != "")
    {
      if(yesOrNo == "y")
      {
        return yesOrNo;
      }
      else if(yesOrNo == "n")
      {
        return yesOrNo;
      }
      else if(yesOrNo == "exit")
      {
        break;
      }
      else
      {
        continue;
      }
    }
    else{
      continue;
    }
  }
  return null;
}

int? createPin()
{
  int pin;
  String? tempPin;
  while(true)
  {
    stdout.write("Create a four digit pin: ");
    tempPin = stdin.readLineSync();
    if(tempPin == null)
    {
      return null;
    }
    else if(tempPin != "")
    {
      if(tempPin.length == 4)
      {
        pin = int.parse(tempPin);
        print("Pin created succesfully");
        break;
      }
      else
      {
        print("Error: Pin Length exceeds or lacks.\nRetry");
        continue;
      }
    }
  }
  return pin;
}

int? verificationForPin(int pin)
{
  while(true)
  {
    int userInputPin;
    String? userPin;
    stdout.write("Enter your pin: ");
    userPin = stdin.readLineSync();

    if(userPin == null)
    {
      print("Error: null occured");
      break; 
    }
    else if(userPin != "")
    {
      if(userPin.length == 4)
      {
        userInputPin = int.parse(userPin);
      }
      else
      {
        print("Error: Pin Length exceeds or lacks.\nRetry");
        continue;
      }
    }
    else
    {
      print("unexpected error");
      break;
    }

    if(userInputPin == pin)
    {
      return 1;
    }
    else{
      print("Wrong Pin.\nTry again");
      continue;
    }
  }
  return null;
}

int addAmount(int balance)
{
  int? amount;
  while(true)
  {
    stdout.write("Enter the amount to be added: ");
    amount = int.parse(stdin.readLineSync()!);
    if(amount <= 0)
    {
      print("Error: Invalid Amount");
      continue;
    }
    else 
    {
      balance += amount;
      break;
    }
  }
  return balance;
}

int withdrawAmount(int balance)
{
  int? amount;
  while(true) 
  {
    stdout.write("Enter the amount to be withdrawn: ");
    amount = int.parse(stdin.readLineSync()!);
    if(amount <= 0 || amount > balance)
    {
      print("Error: Invalid Amount");
      continue; 
    }
    else
    {
      balance -= amount;
      break;
    }
  }
  return balance;
}
void main()
{
  print('''
        ___________________________________
                    VED ATM
        -----------------------------------
                        Welcome, Dear User.
        -----------------------------------
        ''');
  // varaibles
  int option;
  String? tempOption = "";
  int balance = 5000;
  int? pin;
  String? wantToContinue;

  pin = createPin();
  while(true)
  { 
    print('''Select Services
            [1] check balance
            [2] add amount
            [3] withdraw amount
            [4] change pin
            [5] exit''');
    stdout.write("option: ");
    tempOption = stdin.readLineSync();

    if(tempOption == null)
    {
      break;
    }
    else if(tempOption != "")
    {
      option = int.parse(tempOption);
      if(option > 5 || option <= 0)
      {
        print("Error: Invalid Option");
        continue;
      }
    }
    else{
      continue;
    }

    switch(option)
    {
      case 1 when (verificationForPin(pin!) == 1):
        print("Balance: Rs$balance");
        wantToContinue = continueServices();
        if(wantToContinue == null)
        {
          break;
        }
        else if(wantToContinue == "y")
        {
          continue;
        }
        else if(wantToContinue == "n")
        {
          print("Exited Succesfully");
        }
      case 2 when (verificationForPin(pin!) == 1):        
        balance = addAmount(balance);
        print("Amount added succesfully");
        print("New Balance: Rs$balance");
      case 3 when (verificationForPin(pin!) == 1):
        balance = withdrawAmount(balance);
        print("Amount withdrawn succesfully");
        print("Remaining Balance: Rs$balance");
      case 4 when (verificationForPin(pin!) == 1):
        pin = createPin();
      case 5:
        break;
      default:
        print("An error occured");
    }
    
    if(wantToContinue == "n")
    {
      break;
    }
    if(option == 5)
    {
      print("Thanks for using are services.");
      break;
    }
  } 
}