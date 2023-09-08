import 'package:flutter/material.dart';
import 'package:whats_news/src/source/model/source_model.dart';

class SourceListTile extends StatelessWidget {
  const SourceListTile({
    super.key,
    required this.source,
    this.isSelected = false,
    required this.onSelect,
  });

  final SourceModel source;
  final bool isSelected;
  final Function(SourceModel) onSelect;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(source.name, maxLines: 2),
      subtitle: source.description != null
          ? Text(source.description!, maxLines: 3)
          : null,
      trailing: Checkbox(
        value: isSelected,
        onChanged: (_) => onSelect(source),
      ),
      onTap: () => onSelect(source),
    );
  }
}
