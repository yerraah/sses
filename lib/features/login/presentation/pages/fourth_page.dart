import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/features/login/presentation/bloc/profile_bloc.dart';
import 'package:form_app/features/login/presentation/pages/profile_page.dart';

/// Widget, представляющий четвертую страницу.
class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(), // Создание экземпляра блока ProfileBloc
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page Number 4"), // Заголовок страницы
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Переход на страницу профиля при нажатии кнопки
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text("Go to Profile"), // Текст кнопки
              ),
            ],
          ),
        ),
      ),
    );
  }
}
