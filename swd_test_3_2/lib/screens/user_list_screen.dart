import 'package:flutter/material.dart';
import 'package:swd_test_3_2/model/user.dart';
import 'package:swd_test_3_2/widget/user_list.dart';

class UserListScreen extends StatefulWidget {
  final List<User> users;
  final Function(User) onDelete;

  UserListScreen(this.users,this.onDelete);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  deleteUser(User user){
    setState(() {
      widget.onDelete(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          'Users List',
          style: TextStyle(color: Colors.white),
        )
      ),
      body: Padding(
        child: UserList(widget.users,deleteUser),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
