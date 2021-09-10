import 'package:flutter/cupertino.dart';

class NavigationService {
  static NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<void> navigateToPage(String path, Object data) async {
    await navigatorKey.currentState.pushNamed(path, arguments: data);
  }

  Future<void> navigateToPageClear(String path, Object data) async {
    await navigatorKey.currentState.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: data,
    );
  }
}
