import 'dart:convert';

import 'package:data_user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormUpdateUser extends StatefulWidget {
  final VoidCallback method;
  final UserModel model;
  FormUpdateUser({this.method, this.model});
  @override
  _FormUpdateUserState createState() => _FormUpdateUserState();
}

class _FormUpdateUserState extends State<FormUpdateUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  submitUpdate() async {
    final response = await http
        .post("http://192.168.1.10/data_users/update_data_user.php", body: {
      "IDuser": widget.model.userID,
      "name": nameController.text.isEmpty ? widget.model.name : nameController.text,
      "email": emailController.text.isEmpty ? widget.model.email : nameController.text,
      "phone": phoneController.text.isEmpty ? widget.model.phone : phoneController.text,
      "address": addressController.text.isEmpty ? widget.model.address : addressController.text,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Information ... "),
                content: Text(message),
                actions: [TextButton
                (onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  widget.method();
                }, 
                child: Text("Ok"))],
              );
            });
      });
    } else {
      setState(() {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Warning ... "),
                content: Text(message),
                actions: [TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("Ok"))],
              );
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Update User"),),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                  child: Text(
                      "Enter name, education, work experience, and skills to add data users"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                  child: Text("Full Name"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: TextField(
                    maxLines: 3,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.model.name,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                  child: Text("Education"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: TextField(
                    maxLines: 3,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.model.email,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                  child: Text("Work Experience"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: TextField(
                    maxLines: 3,
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.model.phone,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                  child: Text("Skills"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: TextField(
                    maxLines: 3,
                    controller: addressController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.model.address,
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          submitUpdate();
                        });
                      },
                      child: Text("UPDATE"),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
