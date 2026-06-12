import 'package:uuid/uuid.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

/// Use case for creating a new task
class CreateTaskUseCase {
  final TaskRepository repository;

  CreateTaskUseCase({required this.repository});

  Future<void> call(String title) async {
    final task = Task(
      id: const Uuid().v4(),
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    await repository.createTask(task);
  }
}
