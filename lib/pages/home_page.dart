import 'dart:convert';

import 'package:data_user/model/user_model.dart';
import 'package:data_user/pages/form_add_user.dart';
import 'package:data_user/pages/form_update_user.dart';
import 'package:data_user/widget/widget_data_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<UserModel> listUser = [];
  getListUser() async {
    listUser.clear();
    try {
      final response =
      await http.get("http://192.168.1.10/data_users/get_data_user.php");
      if (response.statusCode == 200) {
        setState(() {
          final data = jsonDecode(response.body);

          for (Map item in data) {
            listUser.add(UserModel.fromJson(item));
          }
        });
      }
    } catch (e) {
      print(e);
    }

  }
  
  deleteMethod(String iduser) async {
    final response = await http.post("http://192.168.1.10/delete_users/get_data_user.php", body: {
      "IDuser" : iduser,
    });
    final data= jsonDecode(response.body);
    int value = data['value'];
    String message= data['message'];
    if (value == 1) {
      print(message);
      refresh();
    } else {
      print(message);
    }
  }

  Future<void> refresh() async {
    return getListUser();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getListUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Resume"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
              child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Data User"),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FormAddUser(refresh);
                    }));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add_circle_outline),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Tambah Data"),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                final x = listUser[index];
                return DataUser(
                  idUser: x.userID,
                  name: x.name,
                  email: x.email,
                  onUpdate: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>FormUpdateUser(
                      method: refresh,
                      model: x,),),);
                  },
                   onDelete: () {
                    setState(() {
                        deleteMethod(x.userID);
                          });
                   }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
