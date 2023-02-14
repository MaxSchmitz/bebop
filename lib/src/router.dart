import 'package:bebop/src/sample_feature/sample_item_details_view.dart';
import 'package:bebop/src/sample_feature/sample_item_list_view.dart';
import 'package:bebop/src/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String welcome = '/';
  static String intro = '/intro';
  static String sampleItem = '/sample_item';
  static String chat = '/chat';
  static String vocab = '/vocab';
  static String listen = '/listen';
}

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    AppRoute(ScreenPaths.welcome, (_) => WelcomePage()),
    AppRoute(ScreenPaths.intro, (_) => SampleItemListView()),
    // AppRoute('/sample_item/:id', (_) => SampleItemDetailsView()),
    AppRoute('/sample_item/:id', (s) {
      return SampleItemDetailsView(id: s.params['id']!);
    }),
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}
