import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/screen/10_transition_screen_1.dart';
import 'package:go_router_project/screen/11_error_screen.dart';
import 'package:go_router_project/screen/1_basic_screen.dart';
import 'package:go_router_project/screen/2_named_screen.dart';
import 'package:go_router_project/screen/3_push_screen.dart';
import 'package:go_router_project/screen/4_pop_base_screen.dart';
import 'package:go_router_project/screen/5_pop_return_screen.dart';
import 'package:go_router_project/screen/7_query_parameter.dart';
import 'package:go_router_project/screen/8_nested_screen.dart';
import 'package:go_router_project/screen/9_login_screen.dart';
import 'package:go_router_project/screen/9_private_screen.dart';

import '../screen/10_transition_screen_2.dart';
import '../screen/6_path_param_screen.dart';
import '../screen/8_nested_child_screen.dart';
import '../screen/root_screen.dart';

bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          name: 'basic_screen',
          builder: (context, state) {
            return BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return NamedScreen();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return PushScreen();
          },
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) {
            return PopBaseScreen();
          },
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) {
                return PopReturnScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return QueryParameterScreen();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) => NestedChildScreen(
                routeName: 'nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) => NestedChildScreen(
                routeName: 'nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) => NestedChildScreen(
                routeName: 'nested/c',
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (_, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (_, state) => PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (_, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (_, state) => PrivateScreen(),
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                }
                return null;
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (_, state) => TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (_, state) => CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: TransitionScreenTwo(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

