import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giphy_task/models/giphy_model.dart';
import 'package:giphy_task/resources/api_repository.dart';

part 'giphy_details_event.dart';
part 'giphy_details_state.dart';

class GiphyDetailsBloc extends Bloc<GiphyDetailsEvent, GiphyDetailsState> {
  GiphyDetailsBloc() : super(GiphyDetailInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetGiphyDetailsList>((event, emit) async {
      try {
        emit(GiphyDetailLoading());
        final mList = await _apiRepository.fetchGiphyDataList();
        emit(GiphyDetailLoaded(mList));
        if (mList.error != null) {
          emit(GiphyDetailError(mList.error));
        }
      } on NetworkError {
        emit(GiphyDetailError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
