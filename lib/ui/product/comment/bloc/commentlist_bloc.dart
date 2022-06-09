import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike_shop/common/exception.dart';
import 'package:nike_shop/data/entity/comment.dart';
import 'package:nike_shop/data/repo/comment_repository.dart';

part 'commentlist_event.dart';
part 'commentlist_state.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  final int productId;
  final CommentRepository repository;
  CommentListBloc({required this.productId, required this.repository})
      : super(CommentListLoading()) {
    on<CommentListEvent>((event, emit) async {
      if (event is CommandListStarted) {
        emit(CommentListLoading());

        try {
          final List<CommentEntity> comments =
              await repository.getAll(productId: productId);
          emit(CommentListSuccess(comments: comments));
        } catch (e) {
          emit(CommentListError(
              exeption: e is AppException ? e : AppException()));
        }
      }
    });
  }
}
