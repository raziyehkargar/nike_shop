import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike_shop/common/exception.dart';
import 'package:nike_shop/data/entity/banner.dart';
import 'package:nike_shop/data/entity/product.dart';
import 'package:nike_shop/data/repo/banner_repository.dart';
import 'package:nike_shop/data/repo/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BannerRepository bannerRepository;
  final ProductRepository productRepository;
  HomeBloc({required this.bannerRepository, required this.productRepository})
      : super(Homeloading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        emit(Homeloading());
        try {
          final banners = await bannerRepository.getAll();
          final popularProducts =
              await productRepository.getAll(ProductSort.popular);
          final latestProducts =
              await productRepository.getAll(ProductSort.latest);

          emit(HomeSuccess(
              banners: banners,
              latestProducts: latestProducts,
              popularProducts: popularProducts));
        } catch (e) {
          emit(
            HomeError(
              exception: e is AppException ? e : AppException(message: "خطا"),
            ),
          );
        }
      }
    });
  }
}
