import 'package:flutter_bloc/flutter_bloc.dart';
import 'likes_event.dart';
import 'likes_state.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  LikesBloc() : super(LikesInitial()); // Добавлен конструктор без аргументов

  List<bool> likedPosts = [];

  @override
  Stream<LikesState> mapEventToState(LikesEvent event) async* {
    if (event is LikePostEvent) {
      if (event.index >= 0 && event.index < likedPosts.length) {
        likedPosts[event.index] = !likedPosts[event.index];
        yield LikesLoaded(likedPosts: likedPosts);
      }
    }
  }
}
