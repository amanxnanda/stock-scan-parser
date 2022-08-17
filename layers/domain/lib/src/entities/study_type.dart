/// Study type.

enum StudyType {
  /// Relative Strength Index
  rsi,

  /// Commodity Channel Index
  cci,
}

/// label extension
extension StudyTypeExtension on StudyType {
  /// Returns the label of the study type.
  String get label => name.toUpperCase();
}
