import 'package:nike_shop/data/common/http_client.dart';
import 'package:nike_shop/data/entity/comment.dart';
import 'package:nike_shop/data/source/comment_data_source.dart';

CommentRepository commentRepository =
    CommentRepository(CommentRemoteDataSource(httpClient));

abstract class ICommentRepository {
  Future<List<CommentEntity>> getAll({required int productId});
}

class CommentRepository implements ICommentRepository {
  final ICommentDataSource commentRemoteDataSource;

  CommentRepository(this.commentRemoteDataSource);
  @override
  Future<List<CommentEntity>> getAll({required int productId}) =>
      commentRemoteDataSource.getAll(productId: productId);
}
