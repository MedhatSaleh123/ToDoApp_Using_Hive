import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/features/todo/data/models/task_model.dart';
import 'package:test/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:test/features/todo/presentation/pages/todo_page.dart';
import 'injection_container.dart';

void main() async {
  // Initialize Hive for local storage
  await Hive.initFlutter();
  // Register Hive adapters
  Hive.registerAdapter(TaskModelAdapter());

  // Setup all dependencies
  await setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TodoCubit>(),
      child: MaterialApp(
        title: 'My Todo App',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        ),
        home: const TodoPage(),
      ),
    );
  }
}
