import 'package:flutter/material.dart';
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
    // bannerRepository.getAll().then((value) {
    //   debugPrint(value.toString());
    // }).catchError((e) {
    //   debugPrint(e.toString());
    // });
    // productRepository.getAll(ProductSort.latest).then((value) {
    //   debugPrint(value.toString());
    // }).catchError((e) {
    //   debugPrint(e.toString());
    // });

    // productRepository.search("کفش").then((value) {
    //   debugPrint(value.toString());
    // }).catchError((e) {
    //   debugPrint(e.toString());
    // });
    const defaultTextStyle = TextStyle(
      fontFamily: 'IranYekan',
      color: LightThemeColors.primaryTextColor,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        textTheme: TextTheme(
          subtitle1: defaultTextStyle.copyWith(
              color: LightThemeColors.secondaryTextColor),
          button: defaultTextStyle,
          bodyText2: defaultTextStyle,
          caption: defaultTextStyle.copyWith(
            color: LightThemeColors.secondaryTextColor,
          ),
          headline6: defaultTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: LightThemeColors.primaryColor,
          secondary: LightThemeColors.secondaryColor,
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
