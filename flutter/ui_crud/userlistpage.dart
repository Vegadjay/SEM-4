import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/const_names.dart';

import 'crud.dart';




class UserListPage extends StatefulWidget {
  User user = User();
  UserListPage({super.key , required this.user});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  TextEditingController search = TextEditingController();
  List<Map<String , dynamic>> filteredUser = [];

  void initState(){
    super.initState();
    filteredUser = widget.user.getAllUser();
  }

  void filterUser(String query){
    List<Map<String , dynamic>> allUsers = widget.user.getAllUser();
    setState(() {
      if(query.isEmpty){
        filteredUser = allUsers;
      }
      else{
        filteredUser = allUsers.where((user) => user[NAME].toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  void editUser(int index){
    TextEditingController edit = TextEditingController(text: widget.user.getAllUser()[index][NAME]);

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Edit User"),
        content: TextField(
          controller: edit,
          decoration: InputDecoration(hintText: "Enter New Name"),
        ),
        actions: [
          TextButton(
              onPressed: (){Navigator.pop(context);}, child: Text('Cancel')),
          TextButton(onPressed:(){ setState(() {
            widget.user.updateUser(edit.text , index);
            Navigator.pop(context);
          });}, child: Text("Save"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String , dynamic>> users = widget.user.getAllUser();

    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8) ,
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  labelText: "Search User",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: filterUser,
              ),
            ), Expanded(
              child: ListView.builder(itemCount: filteredUser.length,
                  itemBuilder: (context , index){
                    return ListTile(
                        title: Text(filteredUser[index][NAME] ?? 'Unnamed'),
                        trailing: SizedBox(
                          width: 100,
                          child:  Row(
                            children: [
                              IconButton(onPressed: (){
                                editUser(index);
                              }, icon: Icon(Icons.edit)),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Confirm Delete"),
                                        content: Text("Are you sure you want to delete this user?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context); // Close dialog without deleting
                                            },
                                            child: Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                widget.user.deleteUser(index);
                                                filterUser(search.text);// Delete user
                                              });
                                              Navigator.pop(context); // Close dialog after deleting
                                            },
                                            child: Text("Delete", style: TextStyle(color: Colors.red)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        )
                    );
                  }),
            )
          ],
        )
    );
  }
}
