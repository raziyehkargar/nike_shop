import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/common/utils.dart';
import 'package:nike_shop/data/entity/banner.dart';
import 'package:nike_shop/data/entity/product.dart';
import 'package:nike_shop/data/repo/banner_repository.dart';
import 'package:nike_shop/data/repo/product_repository.dart';
import 'package:nike_shop/ui/custome_widgets/image.dart';
import 'package:nike_shop/ui/custome_widgets/slider.dart';
import 'package:nike_shop/ui/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        final homebloc = HomeBloc(
            bannerRepository: bannerRepository,
            productRepository: productRepository);

        homebloc.add(HomeStarted());
        return homebloc;
      }),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/img/nike_logo.png',
                            height: 24,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      case 1:
                        return Container();
                      case 2:
                        return BannerSlider(
                          banners: state.banners,
                        );
                      case 3:
                        return _HorizontalProductList(
                          title: 'جدیدترین',
                          products: state.latestProducts,
                          onPressed: () {},
                        );

                      case 4:
                        return _HorizontalProductList(
                          title: 'پربازدید ترین',
                          products: state.popularProducts,
                          onPressed: () {},
                        );
                      default:
                        return Container();
                    }
                  },
                );
              } else if (state is Homeloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeError) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.exception.message),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<HomeBloc>(context)
                                .add(HomeRefresh());
                          },
                          child: const Text('تلاش مجدد'),
                        ),
                      ]),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _HorizontalProductList extends StatelessWidget {
  final String title;
  final GestureTapCallback onPressed;
  final List<ProductEntity> products;
  const _HorizontalProductList({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextButton(
                onPressed: onPressed,
                child: Text('مشاهده همه'),
              )
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            itemBuilder: (context, index) => _ProductInfo(
              product: products[index],
            ),
          ),
        )
      ],
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final ProductEntity product;
  const _ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
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
                  SizeBox(height:8),
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
        ));
  }
}
