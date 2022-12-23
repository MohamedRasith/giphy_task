part of 'giphy_bloc.dart';

abstract class GiphyEvent extends Equatable {
  const GiphyEvent();

  @override
  List<Object> get props => [];
}
class GetGiphyList extends GiphyEvent {}