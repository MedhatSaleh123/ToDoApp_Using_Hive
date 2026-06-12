import 'package:get_it/get_it.dart';
import 'package:test/features/todo/data/datasources/task_local_data_source.dart';
import 'package:test/features/todo/data/repositories/task_repository_impl.dart';
import 'package:test/features/todo/domain/repositories/task_repository.dart';
import 'package:test/features/todo/domain/usecases/create_task_usecase.dart';
import 'package:test/features/todo/domain/usecases/delete_task_usecase.dart';
import 'package:test/features/todo/domain/usecases/get_tasks_usecase.dart';
import 'package:test/features/todo/domain/usecases/update_task_usecase.dart';
import 'package:test/features/todo/presentation/cubit/todo_cubit.dart';

/// Dependency Injection container using GetIt
/// This centralizes all dependency registrations for easy management
final getIt = GetIt.instance;

/// Initialize all dependencies
/// Call this function in main() before running the app
Future<void> setupDependencies() async {
  // Data Sources
  final taskLocalDataSource = TaskLocalDataSourceImpl();
  await taskLocalDataSource.init();
  getIt.registerSingleton<TaskLocalDataSource>(taskLocalDataSource);

  // Repositories
  getIt.registerSingleton<TaskRepository>(
    TaskRepositoryImpl(localDataSource: getIt<TaskLocalDataSource>()),
  );

  // Use Cases
  getIt.registerSingleton<CreateTaskUseCase>(
    CreateTaskUseCase(repository: getIt<TaskRepository>()),
  );
  getIt.registerSingleton<GetTasksUseCase>(
    GetTasksUseCase(repository: getIt<TaskRepository>()),
  );
  getIt.registerSingleton<UpdateTaskUseCase>(
    UpdateTaskUseCase(repository: getIt<TaskRepository>()),
  );
  getIt.registerSingleton<DeleteTaskUseCase>(
    DeleteTaskUseCase(repository: getIt<TaskRepository>()),
  );

  // Cubits
  getIt.registerSingleton<TodoCubit>(
    TodoCubit(
      createTaskUseCase: getIt<CreateTaskUseCase>(),
      getTasksUseCase: getIt<GetTasksUseCase>(),
      updateTaskUseCase: getIt<UpdateTaskUseCase>(),
      deleteTaskUseCase: getIt<DeleteTaskUseCase>(),
    ),
  );
}
