import 'package:flutter/material.dart';
import 'package:nike_shop/data/entity/product.dart';
import 'package:nike_shop/data/repo/banner_repository.dart';
import 'package:nike_shop/data/repo/product_repository.dart';
import 'package:nike_shop/theme.dart';
import 'package:nike_shop/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bannerRepository.getAll().then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });
    productRepository.getAll(ProductSort.latest).then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });

    productRepository.search("کفش").then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });
    const defaultTextStyle = TextStyle(
      fontFamily: 'IranYekan',
      color: lightThemeColors.primaryTextColor,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        textTheme: TextTheme(
          subtitle1: defaultTextStyle.copyWith(
              color: lightThemeColors.secondaryTextColor),
          button: defaultTextStyle,
          bodyText2: defaultTextStyle,
          caption: defaultTextStyle.copyWith(
            color: lightThemeColors.secondaryTextColor,
          ),
          headline6: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        colorScheme: const ColorScheme.light(
          primary: lightThemeColors.primaryColor,
          secondary: lightThemeColors.secondaryColor,
          onSecondary: Colors.white,
        ),
        // textButtonTheme: TextButtonThemeData(
        //   style: ButtonStyle(
        //     textStyle: MaterialStateProperty.all(defaultTextStyle),
        //   ),
        // ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
    );
  }
}
