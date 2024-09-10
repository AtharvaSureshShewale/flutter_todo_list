import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _titlecontroller=TextEditingController();
  final _subtitlecontroller=TextEditingController();
  final _timecontroller=TextEditingController();
  bool status=false;
  bool empty=false;

  void showToast(String message){
    Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: Colors.black,
    textColor: Colors.white
    );
  }

  void _submit(){
    Navigator.pop(context,{
      'title':_titlecontroller.text,
      'subtitle':_subtitlecontroller.text,
      'time':_timecontroller.text,
      'important':status});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titlecontroller,
              decoration: InputDecoration(labelText: 'Enter Task Title'),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _subtitlecontroller,
              decoration: InputDecoration(labelText: 'Enter description'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _timecontroller,
              decoration: InputDecoration(labelText: 'Enter Date'),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text('Important',style: TextStyle(color: Colors.red),),
                Checkbox(value: status, onChanged: (bool?newvalue){
                setState(() {
                status=newvalue!;
              });
            }),
              ],
            ),  
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                if(_timecontroller.text.isEmpty || _titlecontroller.text.isEmpty){
                  showToast("Title and Time Can't be Empty");
                }else{
                  _submit();
                }
              }, 
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
