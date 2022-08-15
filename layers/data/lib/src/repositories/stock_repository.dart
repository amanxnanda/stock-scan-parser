import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stock_scan_data/src/models/models.dart';
import 'package:stock_scan_domain/domain.dart';

/// {@template stock_repository}
///  A repository for stock related operations.
/// {@endtemplate}
class StockRepositoryImpl implements StockRepository {
  /// {@macro stock_repository}
  StockRepositoryImpl({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = String.fromEnvironment(
    'STOCK_SCAN_BASE_URL',
    defaultValue: 'mobile-app-challenge.herokuapp.com',
  );

  @override
  Future<List<Stock>> fetch() async {
    final stockRequest = Uri.https(_baseUrl, '/data');

    final response = await _httpClient.get(stockRequest);

    if (response.statusCode != 200) {
      throw StocksFetchRequestFailure(response.statusCode);
    }

    final stocksList = jsonDecode(response.body) as List;

    if (stocksList.isEmpty) {
      throw StocksNotFoundFailure();
    }

    return stocksList.map((stock) => StockModel.fromMap(stock as Map<String, dynamic>)).toList();
  }
}
