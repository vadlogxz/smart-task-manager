class TaskId {
  final String value;

  TaskId(this.value){
    if (value.isEmpty) {
      throw ArgumentError('TaskId cannot be empty');
    }
  }
}