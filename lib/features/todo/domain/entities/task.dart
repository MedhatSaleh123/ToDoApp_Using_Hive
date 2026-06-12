import 'package:equatable/equatable.dart';

/// Domain entity for a Task (business logic representation)
/// Uses Equatable for value comparison
class Task extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  const Task({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, isCompleted, createdAt];

  /// Create a copy with optional field overrides
  Task copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
