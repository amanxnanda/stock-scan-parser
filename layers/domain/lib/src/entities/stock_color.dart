/// StockColor
enum StockColor {
  /// The stock is green.
  green,

  /// The stock is red.
  red,
}

/// Stock Color Extension
extension StockColorX on StockColor {
  /// Returns the hash of the stock color.
  int get colorHash {
    switch (this) {
      case StockColor.green:
        return 0xFF4CAF50;
      case StockColor.red:
        return 0xFFF44336;
    }
  }
}
