// //import 'dart:io';
// import 'package:lab2_todo/todo.dart';
// //void main() {
//  // Todo task = Todo(id:1, title:'Купить продукты',);
// //  print(task);
//   //Todo task1 = Todo(id:1 , title: 'купить продукты');
//  // Todo task2 = Todo(id:2 , title: 'Сделать зарядку');
//  // task1.complete();
//  // print(task1);
//  // print(task2);
//  // stdout.write('vvedite chto-nibud: ');
//  // String? input = stdin.readLineSync();
//  // print('Вы ввели: $input');
// //}
// // import 'dart:io';
// // import 'package:lab2_todo/todo.dart';
// // void printMenu() {
// //   print('');
// //   print('ToDo список');
// //   print('add   - добавить задачу');
// //   print('list    - показать все задачи');
// //   print('done   - отметить выполненной');
// //   print('delete - удалить задачу');
// //   print('exit - выйти');
// // }
// // void addTodo(List<Todo> todos){
// //   stdout.write("Название задачи:");
// //   String? input = stdin.readLineSync();
// //   if (input == null || input.trim().isEmpty){
// //     print('Ошибка: название не может быть пустым');
// //     return;
// //   }
// //   int newId = todos.isEmpty ? 1 : todos.last.id + 1; todos.add(Todo(id: newId, title: input.trim())); 
// //   print("Задача добавлена!");
// // }
// // void listTodos(List<Todo> todos) {
// //   if (todos.isEmpty) {
// //     print('Список задач пуст');
// //     return;
// //   }

// //   print('');
// //   for (var todo in todos) {
// //     print(todo);
// //   }
// // }
// // void comleteTodo(List<Todo> todos){
// //   stdout.write('ID задачи:  ');
// //   String? input = stdin.readLineSync();

// //   if (input == null) return;
  
// //   int? id = int.tryParse(input.trim());
// //   if (id == null) {
// //     print('Ошибка: Введите число');
// //     return;
// //   }
// //   for (var todo in todos) {
// //     if (todo.id == id) {
// //       todo.complete();
// //       print('Задача отмечена выполненной!');
// //       return;
// //     }
// //   }

// //   print('задача с ID $id не найдена');
// // }
// // void deleteTodo(list<Todo> todos) {
// //   stdout.write('ID задачи: ');
// //   String? input = stdin.readLineSync();

// //   if (input == null) return;

// //   int? id = int.tryParse(input.trim());
// //   if (id == null) {
// //     print('Ошибка: введите число');
// //     return;
// //   }

// //   for (int i = 0; i < todos.length; i++) {
// //     if (todos[i].id == id) {
// //       todos.removeAt(i);
// //       print('Задача удалена!');
// //       return;
// //     }
// //   }

// //   print('Задача с ID $id не найдена');
// // }

// import 'dart:io';

// void main() {
//   stdout.write('Введите что-нибудь: ');
//   String? input = stdin.readLineSync();
//   print('Вы ввели: $input');
// }
import 'dart:io';
import 'package:lab2_todo/todo.dart';
import 'package:ansicolor/ansicolor.dart';

// Глобальные цветные "ручки" для вывода
final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen redPen = AnsiPen()..red();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yellowPen = AnsiPen()..yellow();

// ============================================================
// Функция печати меню
// ============================================================
void printMenu() {
  print('');
  print(yellowPen('ToDo список'));
  print('add - добавить задачу');
  print('list - показать все задачи');
  print('done - отметить выполненной');
  print('delete - удалить задачу');
  print('exit - выйти');
}

// ============================================================
// Добавление задачи
// ============================================================
void addTodo(List<Todo> todos) {
  stdout.write('Название задачи: ');
  String? input = stdin.readLineSync();
  if (input == null || input.trim().isEmpty) {
    print(redPen('Ошибка: название не может быть пустым'));
    return;
  }
  // int newId = todos.isEmpty ? 1 : todos.last.id + 1;  // больше не нужно
  todos.add(Todo(title: input.trim()));
  print(bluePen('Задача добавлена!'));
}

// ============================================================
// Вывод списка задач
// ============================================================
void listTodos(List<Todo> todos) {
  if (todos.isEmpty) {
    print('Список задач пуст');
    return;
  }
  print('');
  for (var todo in todos) {
    print(todo);
  }
}

// ============================================================
// Отметить задачу выполненной
// ============================================================
void completeTodo(List<Todo> todos) {
  stdout.write('ID задачи: ');
  String? input = stdin.readLineSync();
  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print(redPen('Ошибка: введите число'));
    return;
  }

  for (var todo in todos) {
    if (todo.id == id) {
      todo.complete();
      print(greenPen('Задача отмечена выполненной!'));
      return;
    }
  }
  print(redPen('Задача с ID $id не найдена'));
}

// ============================================================
// Удаление задачи
// ============================================================
void deleteTodo(List<Todo> todos) {
  stdout.write('ID задачи: ');
  String? input = stdin.readLineSync();
  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print(redPen('Ошибка: введите число'));
    return;
  }

  for (int i = 0; i < todos.length; i++) {
    if (todos[i].id == id) {
      todos.removeAt(i);
      print(greenPen('Задача удалена!'));
      return;
    }
  }
  print(redPen('Задача с ID $id не найдена'));
}

// ============================================================
// Главная функция — точка входа
// ============================================================
void main() {
  List<Todo> todos = [];
  printMenu();

  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null) continue;

    String command = input.trim().toLowerCase();
    if (command.isEmpty) continue;

    switch (command) {
      case 'add':
        addTodo(todos);
        break;
      case 'list':
        listTodos(todos);
        break;
      case 'done':
        completeTodo(todos);
        break;
      case 'delete':
        deleteTodo(todos);
        break;
      case 'exit':
        print('До свидания!');
        return;
      default:
        printMenu();
        print(redPen('Неизвестная команда.'));
    }
  }
}