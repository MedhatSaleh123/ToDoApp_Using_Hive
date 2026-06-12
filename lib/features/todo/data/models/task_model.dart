import 'package:hive/hive.dart';

part 'task_model.g.dart';

/// Hive model for storing tasks in local database.
/// Uses Hive annotation @HiveType to define the model structure.
@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  /// Convert TaskModel to a map (useful for comparisons or serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt,
    };
  }

  /// Create a copy of this model with optional field overrides
  TaskModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt)';
  }
}
