class Task {
  String title;
  String description; 
  bool isDone;
  String priority; // High, Medium, Low
  String tag; // Work, Personal, School

  Task({
    required this.title,
    this.description = '',
    this.isDone = false,
    this.priority = 'Medium',
    this.tag = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
      'priority': priority,
      'tag': tag,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
      priority: map['priority'] ?? 'Medium',
      tag: map['tag'] ?? '',
    );
  }
}