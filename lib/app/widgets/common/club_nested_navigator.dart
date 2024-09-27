import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ClubNestedNavigatorHandler {
  Map<String, dynamic> _arguments = {};
  final int id;

  String? currentRoute;

  ClubNestedNavigatorHandler({required this.id});

  T? getArgument<T>(String key) {
    return _arguments[key];
  }

  void setArguments(Map<String, dynamic> arguments) {
    _arguments.addAll(arguments);
  }

  void clearArguments() {
    _arguments = {};
  }

  Future<T?>? toNamed<T>(
    String route, {
    Map<String, dynamic>? arguments,
  }) {
    if (arguments != null) _arguments.addAll(arguments);

    currentRoute = route;

    return Get.toNamed<T>(
      route,
      id: id,
    );
  }

  Future<T?>? offAndToNamed<T>(
    String route, {
    Map<String, dynamic>? arguments,
  }) {
    if (arguments != null) _arguments.addAll(arguments);

    currentRoute = route;

    return Get.offAndToNamed<T>(
      route,
      id: id,
    );
  }

  void back<T>() {
    Get.back<T>(id: id);
  }

  void parentBack<T>() {
    clearArguments();

    Get.back<T>();
  }
}

class ClubNestedNavigatorRoute {
  final String name;
  final Widget Function() page;
  final Bindings? binding;

  ClubNestedNavigatorRoute({
    required this.name,
    required this.page,
    this.binding,
  });
}

class ClubNavigatorObserver extends NavigatorObserver {
  final String initialRouteName;
  final void Function(String name)? onRouteChanged;

  ClubNavigatorObserver({
    required this.initialRouteName,
    this.onRouteChanged,
  });

  @override
  void didPush(Route route, Route? previousRoute) {
    // avoide onRouteChanged invoke when initial route pushed.
    if (previousRoute == null && route.settings.name == initialRouteName) {
      return;
    }

    // call onRouteChanged function only when destination route has settings with name
    if (route.settings.name != null) {
      onRouteChanged?.call(route.settings.name!);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // call onRouteChanged function only when destination route has settings with name
    if (previousRoute?.settings.name != null) {
      onRouteChanged?.call(previousRoute!.settings.name!);
    }
  }
}

class ClubNestedNavigator extends StatelessWidget {
  final String initialRouteName;
  final ClubNestedNavigatorHandler handler;
  final List<ClubNestedNavigatorRoute> routes;
  final void Function(String routeName)? onRouteChanged;
  final Transition? transition;

  ClubNestedNavigator({
    super.key,
    required this.handler,
    required this.routes,
    required this.initialRouteName,
    this.onRouteChanged,
    this.transition,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: initialRouteName,
      key: Get.nestedKey(handler.id),
      onGenerateRoute: handleGenerateRoute,
      observers: [
        ClubNavigatorObserver(
          initialRouteName: initialRouteName,
          onRouteChanged: onRouteChanged,
        )
      ],
    );
  }

  GetPageRoute? handleGenerateRoute(RouteSettings settings) {
    ClubNestedNavigatorRoute? route = routes.firstWhereOrNull(
      (page) => page.name == settings.name,
    );

    if (route == null) {
      return null;
    }

    return GetPageRoute(
      routeName: route.name,
      page: route.page,
      binding: route.binding,
      settings: settings,
      transition: transition,
    );
  }
}
