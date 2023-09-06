// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SourceModelCWProxy {
  SourceModel id(String id);

  SourceModel name(String name);

  SourceModel description(String? description);

  SourceModel url(String? url);

  SourceModel category(String? category);

  SourceModel language(String? language);

  SourceModel country(String? country);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SourceModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SourceModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SourceModel call({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSourceModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSourceModel.copyWith.fieldName(...)`
class _$SourceModelCWProxyImpl implements _$SourceModelCWProxy {
  const _$SourceModelCWProxyImpl(this._value);

  final SourceModel _value;

  @override
  SourceModel id(String id) => this(id: id);

  @override
  SourceModel name(String name) => this(name: name);

  @override
  SourceModel description(String? description) =>
      this(description: description);

  @override
  SourceModel url(String? url) => this(url: url);

  @override
  SourceModel category(String? category) => this(category: category);

  @override
  SourceModel language(String? language) => this(language: language);

  @override
  SourceModel country(String? country) => this(country: country);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SourceModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SourceModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SourceModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
  }) {
    return SourceModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String?,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String?,
      language: language == const $CopyWithPlaceholder()
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as String?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
    );
  }
}

extension $SourceModelCopyWith on SourceModel {
  /// Returns a callable class that can be used as follows: `instanceOfSourceModel.copyWith(...)` or like so:`instanceOfSourceModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SourceModelCWProxy get copyWith => _$SourceModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceModel _$SourceModelFromJson(Map<String, dynamic> json) => SourceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      url: json['url'] as String?,
      category: json['category'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SourceModelToJson(SourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
