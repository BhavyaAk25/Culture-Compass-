import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'package:xml/xml.dart';

import '../generated/protocol.dart';

class SuggestEndpoint extends Endpoint {
  Future<List<SuggestedSource>> suggestForClaim(
    Session session,
    int claimId,
  ) async {
    final claim = await Claim.db.findById(session, claimId);
    if (claim == null) return [];

    final query = _extractQuery(claim.claimText);

    final results = <SuggestedSource>[];
    results.addAll(await _searchCrossref(query));
    results.addAll(await _searchArxiv(query));

    return results.take(5).toList();
  }

  String _extractQuery(String text) {
    final cleaned = text.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ');
    return cleaned.split(RegExp(r'\s+')).take(6).join(' ');
  }

  Future<List<SuggestedSource>> _searchCrossref(String query) async {
    final uri = Uri.parse(
      'https://api.crossref.org/works?query=${Uri.encodeQueryComponent(query)}&rows=3&mailto=demo@culturecompass.app',
    );
    try {
      final response = await http.get(uri).timeout(
            const Duration(seconds: 6),
          );
      if (response.statusCode != 200) return [];
      final payload = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (payload['message']?['items'] as List?) ?? [];
      return items.map((item) {
        final titleList = (item['title'] as List?) ?? [];
        final title =
            titleList.isNotEmpty ? titleList.first as String : 'Untitled';
        final url = item['URL'] as String? ?? '';
        return SuggestedSource(
          title: title,
          url: url,
          source: 'Crossref',
          snippet: null,
          whyRelevant: 'Related publication',
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }

  Future<List<SuggestedSource>> _searchArxiv(String query) async {
    final uri = Uri.parse(
      'http://export.arxiv.org/api/query?search_query=all:${Uri.encodeQueryComponent(query)}&max_results=3',
    );
    try {
      final response = await http.get(uri).timeout(
            const Duration(seconds: 6),
          );
      if (response.statusCode != 200) return [];
      final document = XmlDocument.parse(response.body);
      final entries = document.findAllElements('entry');
      return entries.map((entry) {
        final title = entry.getElement('title')?.innerText.trim() ?? 'Untitled';
        final link = entry
            .findElements('link')
            .firstWhere(
              (element) => element.getAttribute('rel') == 'alternate',
              orElse: () => entry.findElements('link').first,
            )
            .getAttribute('href');
        return SuggestedSource(
          title: title,
          url: link ?? '',
          source: 'arXiv',
          snippet: null,
          whyRelevant: 'Academic preprint',
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }
}
