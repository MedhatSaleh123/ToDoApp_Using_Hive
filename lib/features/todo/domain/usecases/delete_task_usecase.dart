import '../repositories/task_repository.dart';

/// Use case for deleting a task
class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase({required this.repository});

  Future<void> call(String taskId) async {
    await repository.deleteTask(taskId);
  }
}
