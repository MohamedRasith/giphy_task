part of 'giphy_details_bloc.dart';

abstract class GiphyDetailsState extends Equatable {
  const GiphyDetailsState();

  @override
  List<Object> get props => [];
}

class GiphyDetailInitial extends GiphyDetailsState {}

class GiphyDetailLoading extends GiphyDetailsState {}

class GiphyDetailLoaded extends GiphyDetailsState {
  final Data data;
  const GiphyDetailLoaded(this.data);
}

class GiphyDetailError extends GiphyDetailsState {
  final String? message;
  const GiphyDetailError(this.message);
}
