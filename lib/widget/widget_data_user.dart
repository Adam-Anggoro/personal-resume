import 'package:flutter/material.dart';

class DataUser extends StatelessWidget {
  final String idUser;
  final String name;
  final String email;
  final Function onUpdate;
  final Function onDelete;

  DataUser({
    this.idUser = "",
    this.name = "name",
    this.email = "email",
    this.onUpdate,
    this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID.0" + idUser),
                SizedBox(
                  height: 8,
                ),
                Text(name),
                SizedBox(
                  height: 8,
                ),
                Text(email),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: onUpdate,
                    child: Text("Update"),
                  ),
                ),
                Container(
                  width: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: onDelete,
                    child: Text("Delete"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
