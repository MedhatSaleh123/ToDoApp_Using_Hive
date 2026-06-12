import '../entities/task.dart';
import '../repositories/task_repository.dart';

/// Use case for retrieving all tasks
class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase({required this.repository});

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
