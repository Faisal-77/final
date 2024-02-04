import 'package:final_exam/login_page.dart';
import 'package:final_exam/showpage.dart';
import 'package:final_exam/sqldb.dart';
import 'package:flutter/material.dart';

import 'json/users.dart';
class Show_all extends StatefulWidget {
  @override
  _ShowAll createState() => _ShowAll();
}

class _ShowAll extends State<Show_all> {
  List<Users> usersList = [];

  @override
  void initState() {
    super.initState();
    // Call the function to retrieve users when the widget is created
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    // Assuming DatabaseHelper is your class that contains getAllUsers function
    final db = SqlDb();
    List<Users> users = await db.getAllUsers();

    // Update the state with the retrieved users
    setState(() {
      usersList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: const  Color.fromARGB(255, 208, 177, 255),
        padding: EdgeInsets.only(left: 15.0,right: 15.0),
        child:ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.all( 8.0 ),
              child: ListTile(
                leading: Text(usersList[index].id.toString()),
                title: Text(usersList[index].username),
                subtitle: Text(usersList[index].password),

              ),

            );
          },

        ),

      ),
    );
  }
}

