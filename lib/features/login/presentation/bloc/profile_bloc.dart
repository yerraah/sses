import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/features/login/presentation/bloc/profile_event.dart';
import 'package:form_app/features/login/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileData) {
      yield ProfileLoading();

      try {
        final dio = Dio(); // Создайте экземпляр Dio

        final response =
            await dio.get('https://jsonplaceholder.typicode.com/todos/1');

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = response
              .data; // Используйте response.data вместо json.decode(response.body)
          yield ProfileLoaded(jsonResponse);
        } else {
          yield ProfileError('Ошибка запроса');
        }
      } catch (e) {
        yield ProfileError('Произошла ошибка: $e');
      }
    }
  }
}
