import 'package:flutter/material.dart';
import 'package:swd_test_3_2/model/user.dart';
import 'package:swd_test_3_2/screens/user_list_screen.dart';
import 'package:swd_test_3_2/widget/input_field.dart';
import 'package:swd_test_3_2/widget/button.dart';
import 'package:swd_test_3_2/widget/user_list.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _name;
  String _age;
  String _pos;

  List<User> userList = [];

  addUser(User user) {
    setState(() {
      userList.add(user);
    });
  }

  deleteUser(User user) {
    setState(() {
      userList.removeWhere((_user) => _user.name == user.name);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "User Register by Surayut",
          style: TextStyle(color:Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                labelText: 'Name',
                onSaved: (String value){
                  _name = value;
                },
              ),
              SizedBox(height: 16,),
              InputField(
                labelText: 'Age',
                onSaved: (String value){
                  _age = value;
                },
              ),
              SizedBox(height: 16,),
              InputField(
                labelText: 'Position',
                onSaved: (String value){
                  _pos = value;
                },
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Button(
                      text: 'Add',
                      onPressed: (){
                        if (!_formKey.currentState.validate()) return;
                        _formKey.currentState.save();
                        addUser(User(_name,_age,_pos));
                      },
                    ),
                    SizedBox(width: 10),
                  Button(text: 'List',
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute
                              (builder: (context) =>
                                  UserListScreen(userList,deleteUser),
                              ),
                            );
                          },
                        ),
                ],
              ),
              SizedBox(height: 20),
              UserList(userList,deleteUser),

            ],
          ),
        ),
      ),
    );
  }
}

