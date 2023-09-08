import 'package:flutter/material.dart';
import 'package:whats_news/src/source/components/source_list_tile.dart';
import 'package:whats_news/src/source/model/source_model.dart';

class SourceList extends StatelessWidget {
  const SourceList({
    super.key,
    required this.sources,
    required this.selectedSources,
    required this.onSelect,
  });

  final List<SourceModel> sources;
  final Set<SourceModel> selectedSources;
  final Function(SourceModel) onSelect;

  @override
  Widget build(BuildContext context) {
    if (sources.isEmpty) {
      return const Center(
        child: Text('Nothing to show'),
      );
    }
    return ListView.builder(
      itemBuilder: (_, i) {
        final source = sources[i];
        final isSelected = selectedSources.contains(source);

        return SourceListTile(
          source: source,
          onSelect: onSelect,
          isSelected: isSelected,
        );
      },
      itemCount: sources.length,
    );
  }
}
