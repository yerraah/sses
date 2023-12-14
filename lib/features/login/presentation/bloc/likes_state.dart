import 'package:equatable/equatable.dart';

abstract class LikesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LikesInitial extends LikesState {}

class LikesLoaded extends LikesState {
  final List<bool> likedPosts;

  LikesLoaded({required this.likedPosts});

  @override
  List<Object?> get props => [likedPosts];
}
