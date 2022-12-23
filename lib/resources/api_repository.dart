
import '../models/giphy_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<giphy_model> fetchGiphyList() {
    return _provider.fetchGiphyList();
  }

  Future<Data> fetchGiphyDataList() {
    return _provider.fetchGiphyDataList();
  }
}

class NetworkError extends Error {}
