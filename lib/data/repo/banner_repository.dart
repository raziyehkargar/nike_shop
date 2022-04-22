import 'package:nike_shop/data/common/http_client.dart';
import 'package:nike_shop/data/entity/banner.dart';
import 'package:nike_shop/data/source/banner_data_source.dart';

BannerRepository bannerRepository =
    BannerRepository(RemoteBannerDataSource(httpClient));

abstract class IBannerRepository {
  Future<List<BannerEntity>> getAll();
}

class BannerRepository implements IBannerRepository {
  final IBannerDataSource remoteDataSource;

  BannerRepository(this.remoteDataSource);

  @override
  Future<List<BannerEntity>> getAll() => remoteDataSource.getAll();
}
