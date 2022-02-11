import 'package:flutter/material.dart';

Widget navDrawer(context) => Drawer(
    child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Image.network(
                    "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png")),
            const Text("Навигация по приложению",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.article_outlined),
        title: const Text('Авторизация'),
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      const Divider(
        color: Colors.black12,
        height: 10,
        thickness: 2,
        indent: 10,
        endIndent: 10,
      ),
      ListTile(
        leading: const Icon(Icons.contact_page),
        title: const Text('Контакты'),
        onTap: () {
          Navigator.pushNamed(context, '/UsersListScreen');
        },
      ),
      const Divider(
        color: Colors.black12,
        height: 10,
        thickness: 2,
        indent: 10,
        endIndent: 10,
      ),

    ]));
