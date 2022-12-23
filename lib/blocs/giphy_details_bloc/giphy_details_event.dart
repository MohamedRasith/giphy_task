part of 'giphy_details_bloc.dart';

abstract class GiphyDetailsEvent extends Equatable {
  const GiphyDetailsEvent();

  @override
  List<Object> get props => [];
}
class GetGiphyDetailsList extends GiphyDetailsEvent {}