import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/components/source_list.dart';
import 'package:whats_news/src/source/providers/source_list_provider.dart';

class SourceListScreen extends ConsumerWidget {
  const SourceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourcesNotifier = ref.watch(sourceListNotifierProvider.notifier);
    final sources = ref.watch(sourceListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Whats News 🗞️'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: sourcesNotifier.fetch,
          child: SourceList(
            sources: sources,
          ),
        ),
      ),
    );
  }
}
