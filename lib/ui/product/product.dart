import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_shop/common/utils.dart';
import 'package:nike_shop/data/entity/product.dart';
import 'package:nike_shop/ui/custome_widgets/image.dart';
import 'package:nike_shop/ui/product/details.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  final BorderRadius? borderRadius;

  const ProductItem({
    Key? key,
    required this.product,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      product: product,
                    )));
          },
          child: SizedBox(
            width: 176,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 176,
                      height: 189,
                      child: ImageLoadingService(
                        imageUrl: product.imageUrl,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.heart,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 12),
                  child: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Text(
                      product.previousPrice.withPricelable,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Text(product.price.withPricelable),
                ),
              ],
            ),
          ),
        ));
  }
}
