import 'dart:convert';
import 'package:attest_app/form/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'form/todo.dart';
import 'nav_drawer.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;
  const UserDetailsScreen(this.user, {Key? key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  Future<List<Todo>> fetchTodos() async {
    var responseT = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?userId=${widget.user.id.toString()}'));
    if (responseT.statusCode == 200) {
      List todoResponse = json.decode(responseT.body);
      return todoResponse.map((t) => Todo.fromJson(t)).toList();
    } else {
      throw Exception('Ошибка загрузки');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.user.name.toString()),
          centerTitle: true,
        ),
        drawer: navDrawer(context),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder(
            future: fetchTodos(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: const EdgeInsets.all(2.0),
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      title: Text('Имя: ' + widget.user.name.toString()),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.account_circle_outlined,
                        size: 30,
                      ),
                      title: Text('Имя пользователя: ' +
                          widget.user.username.toString()),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.email,
                        size: 30,
                      ),
                      title: Text('Email: ' + widget.user.email.toString()),
                    ),
                    ListTile(
                        leading: const Icon(
                          Icons.home,
                          size: 30,
                        ),
                        title: Text("Улица: " +
                            widget.user.address.street.toString() +
                            "\nДом: " +
                            widget.user.address.suite.toString() +
                            '\nГород: ' +
                            widget.user.address.city.toString() +
                            "\nИндекс: " +
                            widget.user.address.zipcode.toString() +
                            "\nЛокация: " +
                            widget.user.address.geo.lat.toString() +
                            ":" +
                            widget.user.address.geo.lng.toString())),
                    ListTile(
                      leading: const Icon(
                        Icons.phone,
                        size: 30,
                      ),
                      title: Text('Телефон: ' + widget.user.phone.toString()),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.alternate_email,
                        size: 30,
                      ),
                      title: Text('Сайт: ' + widget.user.website.toString()),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.work,
                        size: 30,
                      ),
                      title: Text('Компания: ' +
                          widget.user.company.name.toString() +
                          "\nКлючевая фраза : " +
                          widget.user.company.catchPhrase.toString() +
                          "\nАктив компании : " +
                          widget.user.company.bs.toString()),
                    ),
                    const Divider(),
                    for (var todo in snapshot.data!)
                      Card(
                        child: CheckboxListTile(
                          title: Text(todo.title.toString()),
                          value: todo.completed, onChanged: null,
                          checkColor: Colors.white,
                        ),
                      ),
                    Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('К списку контактов',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
