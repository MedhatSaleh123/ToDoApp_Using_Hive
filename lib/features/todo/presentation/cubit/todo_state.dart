import 'package:equatable/equatable.dart';
import 'package:test/features/todo/domain/entities/task.dart';

/// Base abstract class for all Todo Cubit states
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

/// Initial state when the app starts
class TodoInitialState extends TodoState {
  const TodoInitialState();
}

/// Loading state when fetching tasks from Hive
class TodoLoadingState extends TodoState {
  const TodoLoadingState();
}

/// Success state containing the list of tasks
class TodoLoadedState extends TodoState {
  final List<Task> tasks;

  const TodoLoadedState({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

/// Error state with error message
class TodoErrorState extends TodoState {
  final String message;

  const TodoErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

/// Empty state when there are no tasks
class TodoEmptyState extends TodoState {
  const TodoEmptyState();
}
