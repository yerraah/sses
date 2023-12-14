import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Виджет для отображения профиля пользователя.
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> profileData = {};

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  /// Получение данных профиля с сервера.
  Future<void> fetchProfileData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        profileData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'), // Заголовок страницы
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (profileData.isNotEmpty) // Если данные профиля не пусты
              Column(
                children: <Widget>[
                  Text('UserID: ${profileData['userId']}'),
                  Text('ID: ${profileData['id']}'),
                  Text('Title: ${profileData['title']}'),
                  Text('Completed: ${profileData['completed']}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
