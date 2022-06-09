import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/data/entity/comment.dart';
import 'package:nike_shop/data/repo/comment_repository.dart';
import 'package:nike_shop/ui/product/comment/bloc/commentlist_bloc.dart';

class CommentList extends StatelessWidget {
  final int productId;
  const CommentList({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        CommentListBloc bloc = CommentListBloc(
            productId: productId, repository: commentRepository);
        bloc.add(CommandListStarted());
        return bloc;
      },
      child: BlocBuilder<CommentListBloc, CommentListState>(
        builder: (context, state) {
          if (state is CommentListLoading) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is CommentListSuccess) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        _CommentItem(comment: state.comments[index]),
                    childCount: state.comments.length));
          } else if (state is CommentListError) {
            return SliverToBoxAdapter(
                child: Center(child: Text(state.exeption.message)));
          } else {
            return const SliverToBoxAdapter(
                child: Center(child: Text("State is not support")));
          }
        },
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  final CommentEntity comment;

  const _CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
          border: Border.all(color: themeData.dividerColor, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.title,
                    style: themeData.textTheme.headline6,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    comment.email,
                    style: themeData.textTheme.caption,
                  ),
                ],
              ),
              Text(
                comment.date,
                style: themeData.textTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            comment.content,
          ),
        ],
      ),
    );
  }
}
