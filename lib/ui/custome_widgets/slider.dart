import 'package:flutter/material.dart';
import 'package:nike_shop/common/utils.dart';
import 'package:nike_shop/data/entity/banner.dart';
import 'package:nike_shop/ui/custome_widgets/image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//Banner slider class
class BannerSlider extends StatelessWidget {
  final List<BannerEntity> banners;
  final PageController _controller = PageController();
  BannerSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            physics: defaultScrollPhisycs,
            itemBuilder: (context, index) => _Slide(banner: banners[index]),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: banners.length,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                  spacing: 3,
                  radius: 4.0,
                  dotWidth: 20,
                  dotHeight: 3,
                  paintStyle: PaintingStyle.fill,
                  dotColor: Colors.grey.shade400,
                  activeDotColor: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Slide Item class
class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final BannerEntity banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ImageLoadingService(
        imageUrl: banner.imageURL,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
