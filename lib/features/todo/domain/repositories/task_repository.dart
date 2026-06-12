import '../entities/task.dart';

/// Abstract repository interface for Task operations (Domain layer)
/// This defines the contract that data layer implementations must follow
abstract class TaskRepository {
  Future<void> createTask(Task task);
  Future<List<Task>> getTasks();
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String taskId);
  Future<void> deleteAllTasks();
}
