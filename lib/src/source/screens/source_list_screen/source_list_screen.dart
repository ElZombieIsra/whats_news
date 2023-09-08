import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/providers/selected_sources_provider.dart';
import 'package:whats_news/src/source/screens/source_list_screen/source_list_screen_controller.dart';
import 'package:whats_news/src/source/screens/source_list_screen/source_list_screen_state.dart';
import 'package:whats_news/src/source/screens/source_list_screen/widgets/source_list_screen_error_widget.dart';
import 'package:whats_news/src/source/screens/source_list_screen/widgets/source_list_screen_loaded.dart';
import 'package:whats_news/src/source/screens/source_list_screen/widgets/source_list_screen_loading.dart';

class SourceListScreen extends StatelessWidget {
  const SourceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sources 🔎'),
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final sourcesNotifier =
              ref.watch(sourceListControllerProvider.notifier);
          final state = ref.watch(sourceListControllerProvider);
          final selectedSources = ref.watch(selectedSourcesProvider);

          if (state is SourcesErrorState) {
            return SourceListScreenError(state.error);
          }

          if (state is SourcesLoadedState) {
            return SourceListScreenLoaded(
              sources: state.sources,
              selectedSources: selectedSources,
              onRefresh: sourcesNotifier.fetch,
              onSelect: (source) => ref
                  .read(selectedSourcesProvider.notifier)
                  .selectSource(source),
            );
          }

          return const SourceListScreenLoading();
        }),
      ),
    );
  }
}
