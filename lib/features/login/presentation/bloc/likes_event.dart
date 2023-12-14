import 'package:equatable/equatable.dart';

abstract class LikesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LikePostEvent extends LikesEvent {
  final int index;

  LikePostEvent(this.index);

  @override
  List<Object?> get props => [index];
}
