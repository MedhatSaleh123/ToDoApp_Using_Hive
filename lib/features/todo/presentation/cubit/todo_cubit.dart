import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/features/todo/domain/entities/task.dart';
import 'package:test/features/todo/domain/usecases/create_task_usecase.dart';
import 'package:test/features/todo/domain/usecases/delete_task_usecase.dart';
import 'package:test/features/todo/domain/usecases/get_tasks_usecase.dart';
import 'package:test/features/todo/domain/usecases/update_task_usecase.dart';
import 'todo_state.dart';

/// Cubit for managing Todo operations (Create, Read, Update, Delete)
/// Handles all business logic for task management
class TodoCubit extends Cubit<TodoState> {
  final CreateTaskUseCase createTaskUseCase;
  final GetTasksUseCase getTasksUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;

  TodoCubit({
    required this.createTaskUseCase,
    required this.getTasksUseCase,
    required this.updateTaskUseCase,
    required this.deleteTaskUseCase,
  }) : super(const TodoInitialState());

  /// Load all tasks from local database
  Future<void> loadTasks() async {
    try {
      emit(const TodoLoadingState());
      final tasks = await getTasksUseCase();

      if (tasks.isEmpty) {
        emit(const TodoEmptyState());
      } else {
        emit(TodoLoadedState(tasks: tasks));
      }
    } catch (e) {
      emit(TodoErrorState(message: 'Failed to load tasks: ${e.toString()}'));
    }
  }

  /// Add a new task
  Future<void> addTask(String title) async {
    try {
      if (title.trim().isEmpty) {
        emit(const TodoErrorState(message: 'Task title cannot be empty'));
        return;
      }

      await createTaskUseCase(title);
      await loadTasks();
    } catch (e) {
      emit(TodoErrorState(message: 'Failed to add task: ${e.toString()}'));
    }
  }

  /// Update an existing task
  Future<void> updateTask(Task task) async {
    try {
      await updateTaskUseCase(task);
      await loadTasks();
    } catch (e) {
      emit(TodoErrorState(message: 'Failed to update task: ${e.toString()}'));
    }
  }

  /// Toggle task completion status
  Future<void> toggleTask(Task task) async {
    try {
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      await updateTaskUseCase(updatedTask);
      await loadTasks();
    } catch (e) {
      emit(TodoErrorState(message: 'Failed to update task: ${e.toString()}'));
    }
  }

  /// Delete a task
  Future<void> deleteTask(String taskId) async {
    try {
      await deleteTaskUseCase(taskId);
      await loadTasks();
    } catch (e) {
      emit(TodoErrorState(message: 'Failed to delete task: ${e.toString()}'));
    }
  }
}
