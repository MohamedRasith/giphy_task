import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giphy_task/models/giphy_model.dart';
import 'package:giphy_task/models/giphy_model.dart';
import 'package:giphy_task/resources/api_repository.dart';

import '../../models/giphy_model.dart';

part 'giphy_event.dart';
part 'giphy_state.dart';

class GiphyBloc extends Bloc<GiphyEvent, GiphyState> {
  GiphyBloc() : super(GiphyInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetGiphyList>((event, emit) async {
      try {
        emit(GiphyLoading());
        final mList = await _apiRepository.fetchGiphyList();
        final fList = await _apiRepository.fetchGiphyDataList();
        emit(GiphyLoaded(mList, fList));
        if (mList.error != null) {
          emit(GiphyError(mList.error));
        }
      } on NetworkError {
        emit(GiphyError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
