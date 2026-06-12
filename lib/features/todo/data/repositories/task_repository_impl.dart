import 'package:test/features/todo/domain/entities/task.dart';
import 'package:test/features/todo/domain/repositories/task_repository.dart';
import '../datasources/task_local_data_source.dart';
import '../models/task_model.dart';

/// Implementation of TaskRepository using local data source
class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  /// Convert TaskModel (data layer) to Task (domain layer)
  Task _modelToEntity(TaskModel model) {
    return Task(
      id: model.id,
      title: model.title,
      isCompleted: model.isCompleted,
      createdAt: model.createdAt,
    );
  }

  /// Convert Task (domain layer) to TaskModel (data layer)
  TaskModel _entityToModel(Task entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
    );
  }

  @override
  Future<void> createTask(Task task) async {
    await localDataSource.createTask(_entityToModel(task));
  }

  @override
  Future<List<Task>> getTasks() async {
    final models = await localDataSource.getTasks();
    return models.map(_modelToEntity).toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    await localDataSource.updateTask(_entityToModel(task));
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await localDataSource.deleteTask(taskId);
  }

  @override
  Future<void> deleteAllTasks() async {
    await localDataSource.deleteAllTasks();
  }
}
