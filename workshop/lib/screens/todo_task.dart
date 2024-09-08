import 'package:flutter/material.dart';
import 'package:workshop/screens/add_task.dart';

class TodoTask extends StatefulWidget {
  const TodoTask({super.key});

  @override
  State<TodoTask> createState() => _TodoTaskState();
}

class _TodoTaskState extends State<TodoTask> {
  List<Map<String,dynamic>> _tasks=[];

  void _toggleTaskCompletion(int index){
    setState(() {
      _tasks[index]['completed']=!_tasks[index]['completed'];
    });
  }

  void _delete(int index){
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _addTask(Map<String,dynamic> task){
    setState(() {
      _tasks.add({
        'title':task['title'],
        'subtitle':task['subtitle'],
        'completed':false,
        'time':task['time'],
        'important':task['important'],
      });
    });
  }

  Future<void> _navigateToAddTask() async{
    final result=await Navigator.push(context
    , MaterialPageRoute(builder: (context)=>AddTask()));

    if(result!=null && result is Map<String,dynamic>){
      _addTask(result);
    }
  } 

  String empty="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children:[
            Icon(Icons.list),
            Text("Todo List"),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task=_tasks[index];
          return ListTile(
            leading: 
            IconButton(
              onPressed:()=>_toggleTaskCompletion(index) , 
              icon: Icon(task['completed']?Icons.check_box:Icons.check_box_outline_blank),
            ),
            title: Text(task['title'],
            style: TextStyle(
              decoration: task['completed']? TextDecoration.lineThrough : null,
              color: task['completed']?Colors.black:task['important'] && !task['completed']?Colors.red:Colors.blue,
            ),
            ),
            subtitle: Text(task['subtitle'], style: TextStyle(decoration: task['completed']?TextDecoration.lineThrough:null),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [      
                Text(task['time']),
                IconButton(
                  onPressed:()=>_delete(index), 
                  icon:Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
