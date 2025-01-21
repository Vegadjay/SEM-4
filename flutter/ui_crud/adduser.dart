import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/curd_with_ui/userlistpage.dart';

import 'crud.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {

  TextEditingController name = TextEditingController();

  User user = User();

  void addUser(){
    if(name.text.isNotEmpty){
      setState(() {
        user.createUser(name.text);
      });

      name.clear();

      Navigator.push(context, MaterialPageRoute(builder: (context) => UserListPage(user: user)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
        backgroundColor: Colors.blue,
      ),

      body: Form(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Enter Your Name",
                  hintText: "Enter Your Name",
                ),
              ),
              ElevatedButton(onPressed: (){
                addUser();
              }, child: Text("Add User"))
            ],
          )),
    );
  }
}
