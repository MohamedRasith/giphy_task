import 'package:dio/dio.dart';
import 'package:giphy_task/models/giphy_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.giphy.com/v1/gifs/trending?api_key=K8jcUL3T8iIyqJQCvC0O7VdLGVhCH13M&limit=25&rating=g';

  Future<giphy_model> fetchGiphyList() async {
    try {
      Response response = await _dio.get(_url);
      return giphy_model.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return giphy_model.withError("Data not found / Connection issue");
    }
  }

  Future<Data> fetchGiphyDataList() async {
    try {
      Response response = await _dio.get(_url);
      return Data.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Data.withError("Data not found / Connection issue");
    }
  }
}
