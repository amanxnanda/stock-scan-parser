/// {@template request_failure}
/// Exception thrown when the server returns an error.
/// {@endtemplate}
class StocksFetchRequestFailure implements Exception {
  /// {@macro request_failure}
  StocksFetchRequestFailure(this.statusCode);

  /// The status code returned by the server.
  final int statusCode;

  @override
  String toString() => 'Request failed ($statusCode).';
}

/// Exception thrown when the stocks are not found.
class StocksNotFoundFailure implements Exception {
  @override
  String toString() => 'Stocks not found.';
}
