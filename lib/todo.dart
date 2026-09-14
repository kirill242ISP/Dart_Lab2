class Todo {
  int id;
  String title;
  bool isDone;
  // Todo(int id, String title){
  //   this.id = id;
  //   this.title = title;
  //   this.isDone = false;
  //   late int id;
  //   late String title;
  //   late bool isDone;
  // }
  Todo({required this.id, required this.title}): isDone = false;
  @override
String toString() {
  String status = isDone ? '[x]' : '[ ]';
  return '$status $id. $title';
}
void complete(){
  isDone = true;
}
}