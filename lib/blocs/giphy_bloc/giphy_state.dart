part of 'giphy_bloc.dart';

abstract class GiphyState extends Equatable {
  const GiphyState();

  @override
  List<Object> get props => [];
}

class GiphyInitial extends GiphyState {}

class GiphyLoading extends GiphyState {}

class GiphyLoaded extends GiphyState {
  final giphy_model giphyModel;
  final Data data;
  const GiphyLoaded(this.giphyModel,this.data);
}

class GiphyError extends GiphyState {
  final String? message;
  const GiphyError(this.message);
}
