import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(FetchProfileData()),
      child: ProfilePageContent(),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Center(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return CircularProgressIndicator();
            } else if (state is ProfileLoaded) {
              final profileData = state.profileData;
              return Column(
                children: <Widget>[
                  Text("Name: ${profileData['name']}"),
                  Text("Email: ${profileData['email']}"),
                  // Добавьте другие поля профиля, если необходимо
                ],
              );
            } else if (state is ProfileError) {
              return Text("Error: ${state.error}");
            } else {
              return Text("Unknown state");
            }
          },
        ),
      ),
    );
  }
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileData) {
      yield ProfileLoading();

      try {
        final dio = Dio(); // Создаем экземпляр Dio

        final response =
            await dio.get('https://jsonplaceholder.typicode.com/todos/1');

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = response.data;
          yield ProfileLoaded(profileData: jsonResponse);
        } else {
          yield ProfileError(error: 'Ошибка запроса');
        }
      } catch (error) {
        yield ProfileError(error: 'Произошла ошибка: $error');
      }
    }
  }
}

abstract class ProfileEvent {}

class FetchProfileData extends ProfileEvent {}

abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Map<String, dynamic> profileData;

  ProfileLoaded({required this.profileData});
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}

class ProfileInitial extends ProfileState {}
