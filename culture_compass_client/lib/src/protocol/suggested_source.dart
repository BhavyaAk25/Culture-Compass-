/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SuggestedSource implements _i1.SerializableModel {
  SuggestedSource._({
    required this.title,
    required this.url,
    required this.source,
    this.snippet,
    this.whyRelevant,
  });

  factory SuggestedSource({
    required String title,
    required String url,
    required String source,
    String? snippet,
    String? whyRelevant,
  }) = _SuggestedSourceImpl;

  factory SuggestedSource.fromJson(Map<String, dynamic> jsonSerialization) {
    return SuggestedSource(
      title: jsonSerialization['title'] as String,
      url: jsonSerialization['url'] as String,
      source: jsonSerialization['source'] as String,
      snippet: jsonSerialization['snippet'] as String?,
      whyRelevant: jsonSerialization['whyRelevant'] as String?,
    );
  }

  String title;

  String url;

  String source;

  String? snippet;

  String? whyRelevant;

  /// Returns a shallow copy of this [SuggestedSource]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SuggestedSource copyWith({
    String? title,
    String? url,
    String? source,
    String? snippet,
    String? whyRelevant,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'source': source,
      if (snippet != null) 'snippet': snippet,
      if (whyRelevant != null) 'whyRelevant': whyRelevant,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SuggestedSourceImpl extends SuggestedSource {
  _SuggestedSourceImpl({
    required String title,
    required String url,
    required String source,
    String? snippet,
    String? whyRelevant,
  }) : super._(
          title: title,
          url: url,
          source: source,
          snippet: snippet,
          whyRelevant: whyRelevant,
        );

  /// Returns a shallow copy of this [SuggestedSource]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SuggestedSource copyWith({
    String? title,
    String? url,
    String? source,
    Object? snippet = _Undefined,
    Object? whyRelevant = _Undefined,
  }) {
    return SuggestedSource(
      title: title ?? this.title,
      url: url ?? this.url,
      source: source ?? this.source,
      snippet: snippet is String? ? snippet : this.snippet,
      whyRelevant: whyRelevant is String? ? whyRelevant : this.whyRelevant,
    );
  }
}
