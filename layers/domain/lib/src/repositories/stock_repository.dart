// ignore_for_file: one_member_abstracts

import 'package:stock_scan_domain/domain.dart';

///  A repository for stock related operations.
abstract class StockRepository {
  /// Gets the stock data
  Future<List<Stock>> fetch();
}
