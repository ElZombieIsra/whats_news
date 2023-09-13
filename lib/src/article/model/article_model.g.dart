// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ArticleModelCWProxy {
  ArticleModel source(SourceModel source);

  ArticleModel author(String? author);

  ArticleModel title(String title);

  ArticleModel description(String? description);

  ArticleModel url(String? url);

  ArticleModel urlToImage(String? urlToImage);

  ArticleModel publishedAt(String? publishedAt);

  ArticleModel content(String? content);

  ArticleModel isFavorite(bool isFavorite);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ArticleModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ArticleModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ArticleModel call({
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    bool? isFavorite,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfArticleModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfArticleModel.copyWith.fieldName(...)`
class _$ArticleModelCWProxyImpl implements _$ArticleModelCWProxy {
  const _$ArticleModelCWProxyImpl(this._value);

  final ArticleModel _value;

  @override
  ArticleModel source(SourceModel source) => this(source: source);

  @override
  ArticleModel author(String? author) => this(author: author);

  @override
  ArticleModel title(String title) => this(title: title);

  @override
  ArticleModel description(String? description) =>
      this(description: description);

  @override
  ArticleModel url(String? url) => this(url: url);

  @override
  ArticleModel urlToImage(String? urlToImage) => this(urlToImage: urlToImage);

  @override
  ArticleModel publishedAt(String? publishedAt) =>
      this(publishedAt: publishedAt);

  @override
  ArticleModel content(String? content) => this(content: content);

  @override
  ArticleModel isFavorite(bool isFavorite) => this(isFavorite: isFavorite);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ArticleModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ArticleModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ArticleModel call({
    Object? source = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? urlToImage = const $CopyWithPlaceholder(),
    Object? publishedAt = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? isFavorite = const $CopyWithPlaceholder(),
  }) {
    return ArticleModel(
      source: source == const $CopyWithPlaceholder() || source == null
          ? _value.source
          // ignore: cast_nullable_to_non_nullable
          : source as SourceModel,
      author: author == const $CopyWithPlaceholder()
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as String?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String?,
      urlToImage: urlToImage == const $CopyWithPlaceholder()
          ? _value.urlToImage
          // ignore: cast_nullable_to_non_nullable
          : urlToImage as String?,
      publishedAt: publishedAt == const $CopyWithPlaceholder()
          ? _value.publishedAt
          // ignore: cast_nullable_to_non_nullable
          : publishedAt as String?,
      content: content == const $CopyWithPlaceholder()
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String?,
      isFavorite:
          isFavorite == const $CopyWithPlaceholder() || isFavorite == null
              ? _value.isFavorite
              // ignore: cast_nullable_to_non_nullable
              : isFavorite as bool,
    );
  }
}

extension $ArticleModelCopyWith on ArticleModel {
  /// Returns a callable class that can be used as follows: `instanceOfArticleModel.copyWith(...)` or like so:`instanceOfArticleModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ArticleModelCWProxy get copyWith => _$ArticleModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      source: SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'isFavorite': instance.isFavorite,
    };
