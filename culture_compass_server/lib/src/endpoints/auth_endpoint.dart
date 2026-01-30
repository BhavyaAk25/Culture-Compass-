import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Demo auth endpoint for hackathon flows.
class AuthEndpoint extends Endpoint {
  Future<UserProfile> signIn(Session session, String displayName) async {
    var existing = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.displayName.equals(displayName),
    );
    if (existing != null) {
      return existing;
    }

    final user = UserProfile(
      displayName: displayName.trim().isEmpty ? 'Explorer' : displayName.trim(),
      createdAt: DateTime.now().toUtc(),
    );
    return await UserProfile.db.insertRow(session, user);
  }

  Future<UserProfile?> getProfile(Session session, int userId) async {
    return UserProfile.db.findById(session, userId);
  }
}
