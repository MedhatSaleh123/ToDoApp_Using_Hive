import '../entities/task.dart';
import '../repositories/task_repository.dart';

/// Use case for updating an existing task
class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase({required this.repository});

  Future<void> call(Task task) async {
    await repository.updateTask(task);
  }
}
