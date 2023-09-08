import 'package:flutter/material.dart';
import 'package:whats_news/src/source/components/source_list.dart';
import 'package:whats_news/src/source/model/source_model.dart';

class SourceListScreenLoaded extends StatelessWidget {
  const SourceListScreenLoaded({
    Key? key,
    required this.sources,
    required this.selectedSources,
    required this.onRefresh,
    required this.onSelect,
  }) : super(key: key);

  final List<SourceModel> sources;
  final Set<SourceModel> selectedSources;
  final Future<void> Function() onRefresh;
  final Function(SourceModel) onSelect;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SourceList(
        sources: sources,
        selectedSources: selectedSources,
        onSelect: onSelect,
      ),
    );
  }
}
