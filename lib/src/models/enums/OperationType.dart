enum OperationType {
  addition,
  subtraction,
  multiplication,
  division,
  percentage,
}

extension OperationTypeExtension on OperationType {

  String get symbol {
    switch (this) {
      case OperationType.addition:
        return '+';
      case OperationType.subtraction:
        return '-';
      case OperationType.multiplication:
        return '×';
      case OperationType.division:
        return '/';
      case OperationType.percentage:
        return '%';
    }
  }
}