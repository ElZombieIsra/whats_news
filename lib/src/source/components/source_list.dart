import 'package:flutter/material.dart';
import 'package:whats_news/src/source/components/source_list_tile.dart';
import 'package:whats_news/src/source/model/source_model.dart';

class SourceList extends StatelessWidget {
  const SourceList({
    super.key,
    required this.sources,
  });

  final List<SourceModel> sources;

  @override
  Widget build(BuildContext context) {
    if (sources.isEmpty) {
      return const Center(
        child: Text('Nothing to show'),
      );
    }
    return ListView.builder(
      itemBuilder: (_, i) => SourceListTile(source: sources[i]),
      itemCount: sources.length,
    );
  }
}
