import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_shop/common/utils.dart';
import 'package:nike_shop/data/entity/product.dart';
import 'package:nike_shop/ui/custome_widgets/image.dart';
import 'package:nike_shop/ui/product/comment/comment-list.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // commentRepository
    //     .getAll(productId: product.id)
    //     .then((value) => debugPrint(value.toString()))
    //     .catchError((e) => debugPrint(e.toString()));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          floatingActionButton: SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('افزودن به سبد خرید'),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: CustomScrollView(
            physics: defaultScrollPhisycs,
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.width * 0.8,
                flexibleSpace: ImageLoadingService(
                  imageUrl: product.imageUrl,
                ),
                foregroundColor: Theme.of(context).textTheme.bodyText2!.color,
                actions: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.heart),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                product.previousPrice.withPricelable,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                              Text(product.price.withPricelable),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                          'این کتونی برای راه رفتن و دویدن بسیار مناسب است. پای شما در آن احساس راحتی میکند. زیرا زیره ان از پیو ساخته شده است.'),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'نظرات کاربران',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text('ثبت نظر')),
                        ],
                      ),
                    ]),
              )),
              CommentList(productId: product.id),
            ],
          )),
    );
  }
}
