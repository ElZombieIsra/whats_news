import 'package:equatable/equatable.dart';
import 'package:whats_news/src/source/model/source_model.dart';

abstract class SourceListScreenState extends Equatable {
  const SourceListScreenState();

  @override
  List<Object?> get props => [];
}

class SourcesErrorState extends SourceListScreenState {
  const SourcesErrorState(this.error);

  final String? error;

  @override
  List<Object?> get props => [error];
}

class SourcesLoadingState extends SourceListScreenState {}

class SourcesLoadedState extends SourceListScreenState {
  const SourcesLoadedState(this.sources);

  final List<SourceModel> sources;

  @override
  List<Object?> get props => [sources];
}
