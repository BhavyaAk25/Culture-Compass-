import 'package:serverpod_flutter/serverpod_flutter.dart';

class AppConfig {
  static String get serverUrl {
    const env = String.fromEnvironment('SERVER_URL');
    final url = env.isEmpty ? 'http://$localhost:8080/' : env;
    return _ensureTrailingSlash(url);
  }

  static String get reportBaseUrl {
    const env = String.fromEnvironment('REPORT_URL');
    if (env.isNotEmpty) {
      return _trimTrailingSlash(env);
    }

    final normalized = _trimTrailingSlash(serverUrl);
    if (normalized.contains(':8080')) {
      return normalized.replaceFirst(':8080', ':8082');
    }
    if (normalized.contains('://api.')) {
      return normalized.replaceFirst('://api.', '://');
    }
    if (normalized.contains('api.')) {
      return normalized.replaceFirst('api.', '');
    }
    return normalized;
  }

  static String reportUrlForSlug(String slug) {
    return '${reportBaseUrl}/report/$slug';
  }

  static String _trimTrailingSlash(String value) {
    return value.endsWith('/') ? value.substring(0, value.length - 1) : value;
  }

  static String _ensureTrailingSlash(String value) {
    return value.endsWith('/') ? value : '$value/';
  }
}
