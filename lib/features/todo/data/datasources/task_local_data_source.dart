import 'package:hive/hive.dart';
import '../models/task_model.dart';

/// Abstract interface for local task data source
abstract class TaskLocalDataSource {
  Future<void> createTask(TaskModel task);
  Future<List<TaskModel>> getTasks();
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String taskId);
  Future<void> deleteAllTasks();
}

/// Implementation of TaskLocalDataSource using Hive
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  static const String _boxName = 'tasks';
  late Box<TaskModel> _taskBox;

  /// Initialize the Hive box (call this in main.dart)
  Future<void> init() async {
    _taskBox = await Hive.openBox<TaskModel>(_boxName);
  }

  @override
  Future<void> createTask(TaskModel task) async {
    try {
      await _taskBox.put(task.id, task);
    } catch (e) {
      throw Exception('Failed to create task: $e');
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      return _taskBox.values.toList();
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    try {
      await _taskBox.put(task.id, task);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    try {
      await _taskBox.delete(taskId);
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  @override
  Future<void> deleteAllTasks() async {
    try {
      await _taskBox.clear();
    } catch (e) {
      throw Exception('Failed to delete all tasks: $e');
    }
  }
}
