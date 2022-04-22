import 'package:nike_shop/data/entity/product.dart';
import 'package:nike_shop/data/source/product_data_source.dart';

import '../common/http_client.dart';

ProductRepository productRepository =
    ProductRepository(ProductRemoteDataSource(httpClient));

abstract class IProductRepository {
  Future<List<ProductEntity>> getAll(int sort);
  Future<List<ProductEntity>> search(String searchTerm);
}

class ProductRepository implements IProductRepository {
  final IProductDataSource remoteDataSource;

  ProductRepository(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getAll(int sort) => remoteDataSource.getAll(sort);

  @override
  Future<List<ProductEntity>> search(String searchTerm) =>
      remoteDataSource.search(searchTerm);
}
