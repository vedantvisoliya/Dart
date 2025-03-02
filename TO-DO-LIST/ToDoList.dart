import 'dart:io';
import 'dart:math';

class TodoList{
  // properties
  int? _id;
  String? _todo;
  bool _isComplete = false;

  // constructor
  TodoList(){generateId();}
  // methods
  void createTodo(String description){this._todo = description;}
  void generateId(){
    Random random = Random();
    int generatedId = 1 + random.nextInt(100);
    this._id = generatedId;
  }
  void completeTodo(){this._isComplete = true;}

}

String? readingOption(){
    String? userInput;
    while(true){      
      stdout.write('''

      [a]dd a todo
      [c]omplete a todo
      [q]uit
      option: ''');
      userInput = stdin.readLineSync();
      if(userInput == null){
        return null;
      }
      else if(userInput != ""){
        if(userInput == 'a'){
          return userInput;
        }
        else if(userInput == 'c'){
          return userInput;
        }
        else if(userInput == 'q'){
          return userInput;
        }
        else{
          print("Please enter correct input!");
          continue;
        }
      }
      else{
        print("Please enter something!");
        continue;
      }
    }
}

String? readingTodo(){
  String? userInput;
  while(true){
    stdout.write("Todo Description: ");
    userInput = stdin.readLineSync();
    if(userInput != ""){
      return userInput;
    }
    else{
      print("Please enter a correct input!");
      continue;
    }
  }
}

int? checkingTodoId(List<TodoList> items){
  String? userInput;
  int? userInputID;
  while(true){
    stdout.write("Enter the ID of todo: ");
    userInput = stdin.readLineSync();
    if(userInput != null){
      if(userInput != ""){
        try{
          userInputID = int.parse(userInput);
          break;
        }
        catch(e){
          print("Error occurred");
          return null;
        }
      }
      else{
        continue;
      }
    } 
  }

  for(final item in items){
    if(item._id == userInputID){
      return userInputID;
    }
  }
  return null;
}

void main(){
  // variables
  int? todo_id;
  String? option;
  String? todo_description;
  bool exit = false;
  List<TodoList> todos = [];
  // app loop
  while(!exit){
    print("\x1B[2J\x1B[0;0H");    
    stdout.write('''
--------------------------------------
          To Do List
______________________________________

''');

    TodoList todoItem = TodoList();
    if(todos.isEmpty != true){
      todos.forEach((items) {
        print("${items._id} | ${items._todo} | ${items._isComplete? "done":"not done"}");
      });
    }

    option = readingOption();

    if(option == 'a'){
      todo_description = readingTodo();
      todoItem.createTodo(todo_description!);
      todos.add(todoItem);
    }
    else if(option == 'c'){
      todo_id = checkingTodoId(todos);
      for(final items in todos){
        if(items._id == todo_id){
          items.completeTodo();
        }
      }
    }
    else if(option == 'q'){
      break;
    }
  }
  print("Thanks for using our services!");
}