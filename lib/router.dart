import 'package:get/get.dart';
import 'grid.dart';
import 'home.dart';

class MyRouter {
  static final route = [
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/grid', page: () => GridView()),
  ];
}