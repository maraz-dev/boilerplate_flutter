import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_flutter/core/storage/share_pref.dart';
import 'package:boilerplate_flutter/view/route/current_user_notifier.dart';

final GlobalKey<NavigatorState> rootNavigation = GlobalKey(debugLabel: "root");
final GlobalKey<NavigatorState> shellNavigation = GlobalKey(debugLabel: "shell");

final routeProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(userStateProvider);

  return GoRouter(
    initialLocation: "/",
    navigatorKey: rootNavigation,
    debugLogDiagnostics: true,
    restorationScopeId: "app",
    redirect: (context, state) {
      final isloggedIn = user.newUser;
      final isFirstLaunch = SharedPrefManager.isFirstLaunch;
      if (isFirstLaunch) {
        log("is first launch");
        if (state.matchedLocation == '/') {
          return '/';
        }
      } else if (isloggedIn || !isloggedIn) {
        if (state.matchedLocation == '/') {
          //return LoginScreen.path;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: "/",
        // name: OnboardingScreen.path,
        //builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
});
