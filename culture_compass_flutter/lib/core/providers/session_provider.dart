import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class SessionState {
  final int? userId;
  final String? displayName;
  final bool loading;

  const SessionState({
    this.userId,
    this.displayName,
    this.loading = false,
  });

  SessionState copyWith({
    int? userId,
    String? displayName,
    bool? loading,
  }) {
    return SessionState(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      loading: loading ?? this.loading,
    );
  }
}

class SessionController extends StateNotifier<SessionState> {
  SessionController() : super(const SessionState());

  Future<void> signIn(String displayName) async {
    state = state.copyWith(loading: true);
    final profile = await client.auth.signIn(displayName);
    state = SessionState(
      userId: profile.id,
      displayName: profile.displayName,
      loading: false,
    );
  }

  void signOut() {
    state = const SessionState();
  }
}

final sessionProvider = StateNotifierProvider<SessionController, SessionState>(
  (ref) => SessionController(),
);
