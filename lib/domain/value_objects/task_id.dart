import 'package:uuid/uuid.dart';

class TaskId {
  final String value;

  const TaskId._(this.value);

  factory TaskId.generate() {
    return TaskId._(Uuid().v4());
  }

  factory TaskId.fromString(String value){
    if (value.isEmpty) {
      throw ArgumentError('TaskId cannot be empty');
    }

    return TaskId._(value);
  }
}