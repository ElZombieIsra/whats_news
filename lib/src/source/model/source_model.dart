import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_model.g.dart';

@CopyWith()
@JsonSerializable()
class SourceModel extends Equatable {
  const SourceModel({
    this.id,
    required this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  final String? id;
  final String name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
  Map<String, dynamic> toJson() => _$SourceModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        url,
        category,
        language,
        country,
      ];
}
