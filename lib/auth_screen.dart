import 'package:attest_app/login_list.dart';
import 'package:attest_app/users_list_screen.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        borderSide: BorderSide(color: Color(0x0ffbbbbb), width: 2));
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 81,
              ),
              const SizedBox(
                width: 103,
                height: 80,
                child: Image(image: AssetImage('assets/dart-logo 1.png')),
              ),
              const SizedBox(
                height: 19,
              ),
              const Text(
                'Введите логин и пароль',
                style: TextStyle(fontSize: 16, color: Color(0x99000000)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              //поле логина
               TextField(
                controller: loginController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFECEFF1),
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  labelText: 'Логин',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //поле пароля
               TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFECEFF1),
                  hintText: '*****',
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  labelText: 'Пароль',
                ),
                controller: passController,
              ),
              const SizedBox(
                height: 28,
              ),
              //Войти
              SizedBox(
                  width: 154,
                  height: 42,
                  child: ElevatedButton(
                      onPressed: () {
                        if (loginController.text == Login &&
                            passController.text == Pass) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const UsersListScreen()));
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Введена неправильная пара логин/пароль!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('Войти'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff0079d0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ))),
              const SizedBox(
                height: 32,
              ),
              //Регистрация
            ],
          ),
        ),
      ),
    );
  }
}
