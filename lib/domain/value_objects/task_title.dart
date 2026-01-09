class TaskTitle {
  final String value;
  static const int _minLength = 3;
  static const int _maxLength = 100;

  TaskTitle(String input) : value = input.trim() {
    if (value.length < _minLength) {
      throw ArgumentError('Task title must be at least $_minLength characters');
    }
    if (value.length > _maxLength) {
      throw ArgumentError('Task title cannot exceed $_maxLength characters');
    }
  }

  @override
  String toString() => value;
}
