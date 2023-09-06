import 'package:flutter/material.dart';
import 'package:whats_news/src/source/model/source_model.dart';

class SourceListTile extends StatelessWidget {
  const SourceListTile({
    super.key,
    required this.source,
  });

  final SourceModel source;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(source.name),
      subtitle: source.description != null ? Text(source.description!) : null,
    );
  }
}
