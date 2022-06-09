part of 'commentlist_bloc.dart';

abstract class CommentListState extends Equatable {
  const CommentListState();

  @override
  List<Object> get props => [];
}

class CommentListLoading extends CommentListState {}

class CommentListSuccess extends CommentListState {
  final List<CommentEntity> comments;

  const CommentListSuccess({required this.comments});

  @override
  List<Object> get props => [comments];
}

class CommentListError extends CommentListState {
  final AppException exeption;

  const CommentListError({required this.exeption});

  @override
  List<Object> get props => [exeption];
}
