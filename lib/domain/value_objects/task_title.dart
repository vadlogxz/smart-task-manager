class TaskTitle {
  final String value;
  static const int _minLength = 3;
  static const int _maxLength = 100;

  const TaskTitle._(this.value);

  factory TaskTitle.fromString(String input) {
    final v = input.trim();

    if (v.isEmpty) {
      throw ArgumentError('Task title cannot be empty');
    }
    if (v.length < _minLength) {
      throw ArgumentError('Task title must be at least $_minLength characters');
    }
    if (v.length > _maxLength) {
      throw ArgumentError('Task title cannot exceed $_maxLength characters');
    }

    return TaskTitle._(v);
  }

  @override
  String toString() => value;
}
