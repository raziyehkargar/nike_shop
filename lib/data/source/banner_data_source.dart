import 'package:dio/dio.dart';
import 'package:nike_shop/data/common/http_response_validator.dart';
import 'package:nike_shop/data/entity/banner.dart';

abstract class IBannerDataSource {
  Future<List<BannerEntity>> getAll();
}

class RemoteBannerDataSource
    with httpResponseValidator
    implements IBannerDataSource {
  final Dio httpClient;

  RemoteBannerDataSource(this.httpClient);

  @override
  Future<List<BannerEntity>> getAll() async {
    final response = await httpClient.get('banner/slider');
    validateResponse(response);

    List<BannerEntity> banners = [];
    (response.data as List).forEach((json) {
      banners.add(BannerEntity.fromJson(json));
    });
    return banners;
  }
}
