import 'package:untitled/utils/const_names.dart';

class User{
  List<Map<String , dynamic>> userList = [];

  void createUser(name){
    Map<String , dynamic> map = {};

    map[NAME] = name;

    userList.add(map);
  }

  List<Map<String , dynamic>> getAllUser(){
    return userList;
  }

  void updateUser(index , name){
    Map<String , dynamic> map = {};

    userList[index][NAME] = name;
  }

  void deleteUser(index){
    userList.removeAt(index);
  }
}