import 'dart:async';
import 'dart:convert';
import 'package:attest_app/form/user.dart';
import 'package:attest_app/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'nav_drawer.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Ошибка загрузки списка контактов');
  }
}

class _UsersListScreenState extends State<UsersListScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список пользователей'),
      ),
      drawer: navDrawer(context),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _usersListView(context, snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
             return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

ListView _usersListView(BuildContext context, List<User> data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _usersListTile(context, data[index]);
      });
}

Card _usersListTile(BuildContext context, User data) {
    return Card(
    child: ListTile(
      leading: Icon(Icons.work, color: Colors.blue[500]),

        title: Text(data.id.toString()+' '+data.name.toString(), style: const TextStyle(fontSize: 20)),
        subtitle:
            Text(data.email.toString(), style: const TextStyle(fontSize: 15)),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserDetailsScreen(data)));
        }),
  );
}
