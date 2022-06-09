part of 'commentlist_bloc.dart';

abstract class CommentListEvent extends Equatable {
  const CommentListEvent();

  @override
  List<Object> get props => [];
}

class CommandListStarted extends CommentListEvent {}
