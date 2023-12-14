import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/features/login/presentation/bloc/profile_bloc.dart';
import 'package:form_app/features/login/presentation/pages/register_form_page.dart';
import 'package:form_app/splash_screen.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),
        // Другие провайдеры, если есть
      ],
      child: MyApp(),
    ),
  );
}

/// MyApp - корневой виджет приложения.
/// Он запускает приложение, используя MaterialApp и предоставляет провайдеры Bloc.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Создание MaterialColor на основе выбранного цвета
    MaterialColor customColor = MaterialColor(
      0xFF1C7E66,
      <int, Color>{
        50: Color(0xFF1C7E66),
        100: Color(0xFF1C7E66),
        200: Color(0xFF1C7E66),
        300: Color(0xFF1C7E66),
        400: Color(0xFF1C7E66),
        500: Color(0xFF1C7E66),
        600: Color(0xFF1C7E66),
        700: Color(0xFF1C7E66),
        800: Color(0xFF1C7E66),
        900: Color(0xFF1C7E66),
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InUIBgram',
      theme: ThemeData(
        primarySwatch: customColor, // Использование созданного MaterialColor
      ),
      home:
          SplashScreen(), // Устанавливает RegisterFormPage в качестве домашней страницы приложения
    );
  }
}
