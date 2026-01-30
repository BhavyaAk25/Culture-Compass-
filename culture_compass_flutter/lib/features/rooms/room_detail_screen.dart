import 'dart:async';

import 'package:culture_compass_client/culture_compass_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/providers/session_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../main.dart';

class RoomDetailScreen extends ConsumerStatefulWidget {
  final int roomId;

  const RoomDetailScreen({super.key, required this.roomId});

  @override
  ConsumerState<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends ConsumerState<RoomDetailScreen> {
  Room? _room;
  List<UserProfile> _members = [];
  List<Source> _sources = [];
  List<Claim> _claims = [];
  List<Contradiction> _contradictions = [];
  Brief? _brief;
  final Map<int, Presence> _presenceMap = {};

  StreamSubscription<RoomEvent>? _roomSub;
  StreamSubscription<Presence>? _presenceSub;
  Timer? _heartbeatTimer;

  @override
  void initState() {
    super.initState();
    _loadAll();
    _startStreams();
  }

  @override
  void dispose() {
    _roomSub?.cancel();
    _presenceSub?.cancel();
    _heartbeatTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadAll() async {
    await Future.wait([
      _loadRoom(),
      _loadSources(),
      _loadClaims(),
      _loadContradictions(),
      _loadBrief(),
      _loadMembers(),
    ]);
  }

  Future<void> _loadRoom() async {
    final room = await client.room.getRoom(widget.roomId);
    if (mounted) {
      setState(() => _room = room);
    }
  }

  Future<void> _loadMembers() async {
    final members = await client.room.listRoomMembers(widget.roomId);
    if (mounted) {
      setState(() => _members = members);
    }
  }

  Future<void> _loadSources() async {
    final sources = await client.source.listSources(widget.roomId);
    if (mounted) {
      setState(() => _sources = sources);
    }
  }

  Future<void> _loadClaims() async {
    final claims = await client.claim.listClaims(widget.roomId);
    if (mounted) {
      setState(() => _claims = claims);
    }
  }

  Future<void> _loadContradictions() async {
    final contradictions =
        await client.contradiction.listContradictions(widget.roomId);
    if (mounted) {
      setState(() => _contradictions = contradictions);
    }
  }

  Future<void> _loadBrief() async {
    final brief = await client.brief.getLatestBrief(widget.roomId);
    if (mounted) {
      setState(() => _brief = brief);
    }
  }

  void _startStreams() {
    final userId = ref.read(sessionProvider).userId;
    if (userId == null) return;

    _roomSub =
        client.source.streamRoomEvents(widget.roomId).listen((event) async {
      switch (event.type) {
        case 'source_added':
          await _loadSources();
          break;
        case 'claim_added':
          await _loadClaims();
          break;
        case 'contradiction_added':
          await _loadContradictions();
          break;
        case 'brief_updated':
          await _loadBrief();
          break;
        case 'member_joined':
          await _loadMembers();
          break;
      }
    });

    _presenceSub =
        client.presence.streamPresence(widget.roomId).listen((presence) {
      setState(() {
        _presenceMap[presence.userId] = presence;
      });
    });

    client.presence.setStatus(widget.roomId, userId, 'online');
    _heartbeatTimer = Timer.periodic(
      const Duration(seconds: 15),
      (_) => client.presence.heartbeat(widget.roomId, userId),
    );
  }

  Future<void> _addSource() async {
    final urlController = TextEditingController();
    final snippetController = TextEditingController();
    final userId = ref.read(sessionProvider).userId;
    if (userId == null) return;
    String regionTag = 'US';
    String disciplineTag = 'Policy';
    String stanceTag = 'Neutral';

    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add source',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: urlController,
                    decoration: const InputDecoration(labelText: 'Source URL'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: regionTag,
                    items: const [
                      DropdownMenuItem(value: 'US', child: Text('US')),
                      DropdownMenuItem(value: 'EU', child: Text('EU')),
                      DropdownMenuItem(value: 'Asia', child: Text('Asia')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    onChanged: (value) => setState(
                      () => regionTag = value ?? regionTag,
                    ),
                    decoration: const InputDecoration(labelText: 'Region'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: disciplineTag,
                    items: const [
                      DropdownMenuItem(value: 'Econ', child: Text('Econ')),
                      DropdownMenuItem(value: 'Policy', child: Text('Policy')),
                      DropdownMenuItem(
                          value: 'Culture', child: Text('Culture')),
                      DropdownMenuItem(value: 'Tech', child: Text('Tech')),
                    ],
                    onChanged: (value) => setState(
                      () => disciplineTag = value ?? disciplineTag,
                    ),
                    decoration: const InputDecoration(labelText: 'Discipline'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: stanceTag,
                    items: const [
                      DropdownMenuItem(
                          value: 'Support', child: Text('Support')),
                      DropdownMenuItem(
                          value: 'Critique', child: Text('Critique')),
                      DropdownMenuItem(
                          value: 'Neutral', child: Text('Neutral')),
                    ],
                    onChanged: (value) => setState(
                      () => stanceTag = value ?? stanceTag,
                    ),
                    decoration: const InputDecoration(labelText: 'Stance'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: snippetController,
                    decoration: const InputDecoration(
                      labelText: 'Paste a key snippet (optional)',
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (confirmed == true) {
      await client.source.addSource(
        widget.roomId,
        urlController.text,
        snippetController.text,
        userId,
        regionTag,
        disciplineTag,
        stanceTag,
      );
      await _loadSources();
    }
  }

  Future<void> _addClaim(Source source) async {
    final claimController = TextEditingController();
    final quoteController = TextEditingController(text: source.snippet ?? '');
    final userId = ref.read(sessionProvider).userId;
    if (userId == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create claim'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: claimController,
                  decoration: const InputDecoration(labelText: 'Claim text'),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: quoteController,
                  decoration:
                      const InputDecoration(labelText: 'Quote / receipt'),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Create'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await client.claim.addClaim(
        widget.roomId,
        source.id!,
        claimController.text,
        quoteController.text,
        userId,
      );
      await _loadClaims();
    }
  }

  Future<void> _addContradiction() async {
    if (_claims.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add at least two claims first.')),
      );
      return;
    }
    final userId = ref.read(sessionProvider).userId;
    if (userId == null) return;

    Claim? claimA = _claims.first;
    Claim? claimB = _claims.length > 1 ? _claims[1] : _claims.first;
    String type = 'definition';
    final explanationController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Link contradiction'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<Claim>(
                      value: claimA,
                      items: _claims
                          .map((claim) => DropdownMenuItem(
                                value: claim,
                                child: Text(
                                  claim.claimText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() => claimA = value),
                      decoration: const InputDecoration(labelText: 'Claim A'),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<Claim>(
                      value: claimB,
                      items: _claims
                          .map((claim) => DropdownMenuItem(
                                value: claim,
                                child: Text(
                                  claim.claimText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() => claimB = value),
                      decoration: const InputDecoration(labelText: 'Claim B'),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: type,
                      items: const [
                        DropdownMenuItem(
                          value: 'time_period',
                          child: Text('Time period'),
                        ),
                        DropdownMenuItem(
                          value: 'geography',
                          child: Text('Geography'),
                        ),
                        DropdownMenuItem(
                          value: 'definition',
                          child: Text('Definition'),
                        ),
                        DropdownMenuItem(
                          value: 'methodology',
                          child: Text('Methodology'),
                        ),
                        DropdownMenuItem(
                          value: 'values',
                          child: Text('Values'),
                        ),
                      ],
                      onChanged: (value) =>
                          setState(() => type = value ?? type),
                      decoration:
                          const InputDecoration(labelText: 'Disagreement type'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: explanationController,
                      decoration: const InputDecoration(
                        labelText: 'Explanation',
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Link'),
                ),
              ],
            );
          },
        );
      },
    );

    if (confirmed == true && claimA != null && claimB != null) {
      await client.contradiction.addContradiction(
        widget.roomId,
        claimA!.id!,
        claimB!.id!,
        type,
        explanationController.text,
        userId,
      );
      await _loadContradictions();
    }
  }

  Future<void> _generateBrief() async {
    final userId = ref.read(sessionProvider).userId;
    if (userId == null) return;

    await client.brief.generateBrief(widget.roomId, userId);
    await _loadBrief();
  }

  Future<void> _publishRoom() async {
    final room = await client.room.publishRoom(widget.roomId);
    if (!mounted || room?.publicSlug == null) return;

    final url = 'http://localhost:8082/report/${room!.publicSlug}';
    if (!mounted) return;
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Public report ready'),
          content: SelectableText(url),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: const Text('Open'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _challengeClaim(Claim claim) async {
    final userId = ref.read(sessionProvider).userId;
    if (userId == null) return;
    final suggestions = await client.suggest.suggestForClaim(claim.id!);
    if (!mounted) return;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Challenge this claim',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Pull counter-evidence from Crossref and arXiv, then add it as a new source.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: suggestions.isEmpty
                        ? Center(
                            child: Text(
                              'No counter-sources found right now.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        : ListView.separated(
                            controller: scrollController,
                            itemCount: suggestions.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              final suggestion = suggestions[index];
                              final subtitle = [
                                suggestion.source,
                                if (suggestion.whyRelevant != null &&
                                    suggestion.whyRelevant!.isNotEmpty)
                                  suggestion.whyRelevant!,
                              ].join(' • ');
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    suggestion.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    subtitle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        tooltip: 'Open',
                                        onPressed: () async {
                                          final uri = Uri.parse(suggestion.url);
                                          if (await canLaunchUrl(uri)) {
                                            await launchUrl(
                                              uri,
                                              mode: LaunchMode
                                                  .externalApplication,
                                            );
                                          }
                                        },
                                        icon: const Icon(Icons.launch),
                                      ),
                                      IconButton(
                                        tooltip: 'Add as source',
                                        onPressed: () async {
                                          final messenger =
                                              ScaffoldMessenger.of(context);
                                          await client.source.addSource(
                                            widget.roomId,
                                            suggestion.url,
                                            suggestion.whyRelevant,
                                            userId,
                                            null,
                                            null,
                                            'Critique',
                                          );
                                          await _loadSources();
                                          if (!mounted) return;
                                          messenger.showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Added to sources.',
                                              ),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final onlineCount = _presenceMap.length;
    final roomTitle = _room?.title ?? 'Research Room';
    final inviteCode = _room?.code ?? '';

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(roomTitle),
              const SizedBox(height: 4),
              Text(
                '${_members.length} members • $onlineCount online',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.textMuted),
              ),
            ],
          ),
          actions: [
            IconButton(
              tooltip: 'Copy invite code',
              onPressed: inviteCode.isEmpty
                  ? null
                  : () async {
                      final messenger = ScaffoldMessenger.of(context);
                      await Clipboard.setData(
                        ClipboardData(text: inviteCode),
                      );
                      if (!mounted) return;
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text('Invite code copied: $inviteCode'),
                        ),
                      );
                    },
              icon: const Icon(Icons.vpn_key),
            ),
            IconButton(
              tooltip: 'Share invite code',
              onPressed: inviteCode.isEmpty
                  ? null
                  : () => Share.share('Join my room: $inviteCode'),
              icon: const Icon(Icons.share),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sources'),
              Tab(text: 'Claims'),
              Tab(text: 'Contradictions'),
              Tab(text: 'Brief'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addSource,
          icon: const Icon(Icons.add),
          label: const Text('Add source'),
        ),
        body: TabBarView(
          children: [
            _buildSourcesTab(),
            _buildClaimsTab(),
            _buildContradictionsTab(),
            _buildBriefTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildSourcesTab() {
    if (_sources.isEmpty) {
      return _emptyState('No sources yet', 'Add the first link to start.');
    }
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _sources.length + 2,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildQuickSteps();
        }
        if (index == 1) {
          return _buildDiversityMeter();
        }
        final source = _sources[index - 2];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  source.title ?? source.url,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  source.url,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.textMuted),
                ),
                if (source.snippet != null) ...[
                  const SizedBox(height: 12),
                  Text(source.snippet!),
                ],
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton.icon(
                    onPressed: () => _addClaim(source),
                    icon: const Icon(Icons.post_add),
                    label: const Text('Create claim'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDiversityMeter() {
    final regionCounts = <String, int>{};
    final disciplineCounts = <String, int>{};
    final stanceCounts = <String, int>{};

    for (final source in _sources) {
      final region = source.regionTag ?? 'Unassigned';
      regionCounts[region] = (regionCounts[region] ?? 0) + 1;

      final discipline = source.disciplineTag ?? 'Unassigned';
      disciplineCounts[discipline] = (disciplineCounts[discipline] ?? 0) + 1;

      final stance = source.stanceTag ?? 'Unassigned';
      stanceCounts[stance] = (stanceCounts[stance] ?? 0) + 1;
    }

    Widget buildRow(String label, Map<String, int> counts) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: counts.entries
                .map(
                  (entry) => Chip(
                    label: Text('${entry.key} • ${entry.value}'),
                  ),
                )
                .toList(),
          ),
        ],
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diversity meter',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            buildRow('Region', regionCounts),
            const SizedBox(height: 12),
            buildRow('Discipline', disciplineCounts),
            const SizedBox(height: 12),
            buildRow('Stance', stanceCounts),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSteps() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick steps',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '1) Add a source link  2) Create a claim  3) Link contradictions  4) Generate brief',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClaimsTab() {
    if (_claims.isEmpty) {
      return _emptyState('No claims yet', 'Highlight a receipt from a source.');
    }

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _claims.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Use Challenge',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tap “Challenge” to fetch counter-sources from Crossref and arXiv.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          );
        }
        final claim = _claims[index - 1];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  claim.claimText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  '"${claim.quote}"',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.accent),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () => _challengeClaim(claim),
                      child: const Text('Challenge'),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: _addContradiction,
                      child: const Text('Link contradiction'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContradictionsTab() {
    if (_contradictions.isEmpty) {
      return _emptyState(
        'No contradictions yet',
        'Link two claims to see disagreement patterns.',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _contradictions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final contradiction = _contradictions[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(
                      label: Text(contradiction.disagreementType),
                    ),
                    const Spacer(),
                    const Icon(Icons.compare_arrows),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Claim A: ${_claimText(contradiction.claimAId)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  'Claim B: ${_claimText(contradiction.claimBId)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  contradiction.explanation,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBriefTab() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _generateBrief,
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text('Generate brief'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _publishRoom,
                  icon: const Icon(Icons.public),
                  label: const Text('Publish'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _brief == null
                ? _emptyState(
                    'No brief yet',
                    'Generate a summary with citations.',
                  )
                : Markdown(
                    data: _brief!.markdown,
                    styleSheet: MarkdownStyleSheet.fromTheme(
                      Theme.of(context),
                    ).copyWith(
                      p: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState(String title, String subtitle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_stories,
                size: 56, color: AppColors.accent.withOpacity(0.8)),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _claimText(int claimId) {
    for (final claim in _claims) {
      if (claim.id == claimId) {
        return claim.claimText;
      }
    }
    return 'Claim #$claimId';
  }
}
