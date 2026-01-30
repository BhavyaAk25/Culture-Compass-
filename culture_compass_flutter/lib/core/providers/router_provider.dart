import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/rooms/room_list_screen.dart';
import '../../features/rooms/room_detail_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'session_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final session = ref.watch(sessionProvider);
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return SplashGate(
            childBuilder: (context) {
              if (session.userId == null) {
                return const AuthScreen();
              }
              return const RoomListScreen();
            },
          );
        },
      ),
      GoRoute(
        path: '/room/:id',
        builder: (context, state) {
          if (session.userId == null) {
            return SplashGate(
              childBuilder: (context) => const AuthScreen(),
            );
          }
          final roomId = int.tryParse(state.pathParameters['id'] ?? '');
          if (roomId == null) {
            return SplashGate(
              childBuilder: (context) => const AuthScreen(),
            );
          }
          return RoomDetailScreen(roomId: roomId);
        },
      ),
    ],
  );
});

class SplashGate extends StatefulWidget {
  final WidgetBuilder childBuilder;

  const SplashGate({super.key, required this.childBuilder});

  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate> {
  bool _showSplash = true;

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return SplashScreen(
        onComplete: () {
          if (!mounted) return;
          setState(() {
            _showSplash = false;
          });
        },
      );
    }
    return widget.childBuilder(context);
  }
}
