import 'package:flutter/material.dart';
import 'users.dart';
import 'users_api.dart';

class adminAllUsers extends StatefulWidget {
  @override
  _adminAllUsersState createState() => _adminAllUsersState();
}

class _adminAllUsersState extends State<adminAllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchusers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Users users = snapshot.data[index];

                  return allusers(users);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  allusers(Users users) {
    return ListTile(
      leading: Text(users.name),
      trailing: Text(users.phone),
      // subtitle: Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [Icon(Icons.phone), Text(users.phone)],
      //   ),
      // ),
    );
  }
}
