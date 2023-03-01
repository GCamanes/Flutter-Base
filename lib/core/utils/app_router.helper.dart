import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/encoder.helper.dart';
import 'package:flutter_base/features/detail/presentation/pages/detail.page.dart';
import 'package:flutter_base/features/home/presentation/pages/home.page.dart';
import 'package:flutter_base/features/splashscreen/presentation/pages/splashscreen.page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouterHelper {
  static final GoRouter appRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: routeSplashscreen,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashscreenPage(),
      ),
      GoRoute(
        path: routeHome,
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: '$routeHome$routeDetail/:detailId',
        builder: (BuildContext context, GoRouterState state) => DetailPage(
          // No need to decode detailId because
          // it's already decoded by go_router
          id: state.params['detailId']!,
        ),
      ),
    ],
  );

  static GoRouter get router => appRouter;

  /// Route constants
  static const String routeSplashscreen = '/';
  static const String routeHome = '/home';
  static const String routeDetail = '/detail';

  /// Navigation helpers
  static void returnToSplashscreen() =>
      router.go(AppRouterHelper.routeSplashscreen);

  static void goToHome() => router.go(AppRouterHelper.routeHome);

  static void goToDetail(String detailId) {
    /// Here we encode it to prevent bad encoding when transmitting params
    /// to navigation
    final String encodedDetailId = EncoderHelper.encodeUri(detailId);
    router.push(
      '${AppRouterHelper.routeHome}'
      '${AppRouterHelper.routeDetail}'
      '/$encodedDetailId',
    );
  }
}
