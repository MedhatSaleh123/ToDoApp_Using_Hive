## Flutter To-Do App with Hive & Clean Architecture

A production-ready Flutter To-Do application demonstrating clean architecture principles with Hive local storage and Cubit state management.
📱 Screenshots

<img width="271" height="584" alt="1" src="https://github.com/user-attachments/assets/ea67875c-92b1-4e98-8156-00face6cee4f" />
<img width="277" height="595" alt="2" src="https://github.com/user-attachments/assets/2152be98-7c4b-408e-b485-d72d806e1dfb" />
<img width="267" height="593" alt="3" src="https://github.com/user-attachments/assets/d7f1c709-ba2d-49f9-baf7-b420ab938f01" />
<img width="268" height="584" alt="4" src="https://github.com/user-attachments/assets/a7263073-4b2e-4cf7-a146-6edbe0a8d088" />


### 📋 Features

- ✅ **Add, Edit, Delete Tasks** - Full CRUD operations
- ✅ **Mark Tasks Complete/Incomplete** - Toggle task status with checkbox
- ✅ **Local Persistence** - All tasks saved using Hive database
- ✅ **Empty State UI** - User-friendly message when no tasks exist
- ✅ **Swipe to Delete** - Modern gesture-based deletion
- ✅ **Material Design 3** - Modern UI with Material 3 components
- ✅ **State Management** - Cubit for reactive state handling
- ✅ **Clean Architecture** - Organized layer-based project structure
- ✅ **Responsive Layout** - Works seamlessly on all screen sizes

### 🏗️ Project Structure

```
lib/
├── core/
│   ├── error/failures.dart
│   └── usecases/usecase.dart
├── features/
│   ├── auth/                    (Previous auth module)
│   └── todo/                    (New Todo module)
│       ├── data/
│       │   ├── datasources/
│       │   │   └── task_local_data_source.dart
│       │   ├── models/
│       │   │   ├── task_model.dart
│       │   │   └── task_model.g.dart
│       │   └── repositories/
│       │       └── task_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── task.dart
│       │   ├── repositories/
│       │   │   └── task_repository.dart
│       │   └── usecases/
│       │       ├── create_task_usecase.dart
│       │       ├── get_tasks_usecase.dart
│       │       ├── update_task_usecase.dart
│       │       └── delete_task_usecase.dart
│       └── presentation/
│           ├── cubit/
│           │   ├── todo_cubit.dart
│           │   └── todo_state.dart
│           ├── pages/
│           │   └── todo_page.dart
│           └── widgets/
│               ├── task_card.dart
│               └── task_input_dialog.dart
├── injection_container.dart
└── main.dart
```

### 📦 Dependencies

Added packages to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_bloc: ^8.1.2        # State management
  hive: ^2.2.3                # Local database
  hive_flutter: ^1.1.0        # Hive Flutter integration
  get_it: ^7.6.0              # Dependency injection
  uuid: ^4.0.0                # Task ID generation
  equatable: ^2.0.5           # Value equality

dev_dependencies:
  hive_generator: ^2.0.1      # Generate Hive adapters
  build_runner: ^2.4.6        # Code generation tool
```

### 🚀 Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Generate Hive adapters:**
   ```bash
   flutter pub run build_runner build
   ```
   Or for watch mode (auto-rebuild on changes):
   ```bash
   flutter pub run build_runner watch
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

### 🏛️ Architecture Layers Explanation

#### Data Layer (`data/`)
- **Models**: `TaskModel` - Hive database representation with adapters
- **DataSources**: `TaskLocalDataSource` - Abstracts Hive database operations
- **Repositories**: `TaskRepositoryImpl` - Converts between data/domain layers

#### Domain Layer (`domain/`)
- **Entities**: `Task` - Business logic representation (never changes)
- **Repositories**: Abstract `TaskRepository` - Contract for data access
- **UseCases**: Business operations (`CreateTaskUseCase`, etc.)

#### Presentation Layer (`presentation/`)
- **Cubit**: `TodoCubit` - State management & business logic
- **States**: `TodoState` variants - Different UI states
- **Pages**: `TodoPage` - Main screen
- **Widgets**: Reusable components (`TaskCard`, `TaskInputDialog`)

### 🔄 Data Flow

```
User Action (UI)
       ↓
   TodoCubit (handles business logic)
       ↓
   UseCases (execute specific operations)
       ↓
   TaskRepository (abstract interface)
       ↓
   TaskRepositoryImpl (concrete implementation)
       ↓
   TaskLocalDataSource (Hive database operations)
       ↓
   Hive Box (persistent local storage)
```

### 💾 Local Storage with Hive

- **Box Name**: `tasks`
- **Adapter TypeId**: 0 (for TaskModel)
- **Storage Location**: Device application documents directory
- **Automatic Persistence**: All CRUD operations automatically persist to disk

### 🎨 UI Components

#### TodoPage
Main screen with:
- AppBar with title "My Tasks"
- FloatingActionButton to add new tasks
- BlocBuilder showing different states (loading, empty, error, loaded)
- ListView of task cards

#### TaskCard
Individual task display with:
- Checkbox to toggle completion status
- Title (with strikethrough when completed)
- Created date/time
- Edit & Delete popup menu
- Swipe-to-delete gesture

#### TaskInputDialog
Bottom sheet dialog for:
- Adding new tasks
- Editing existing tasks
- Form validation
- Keyboard auto-focus

### 🧩 State Management (Cubit)

**States:**
- `TodoInitialState` - App startup
- `TodoLoadingState` - Loading tasks
- `TodoLoadedState` - Tasks loaded and ready
- `TodoEmptyState` - No tasks exist
- `TodoErrorState` - Error occurred

**Methods:**
- `loadTasks()` - Fetch all tasks
- `addTask(title)` - Create new task
- `updateTask(task)` - Modify existing task
- `toggleTask(task)` - Change completion status
- `deleteTask(id)` - Remove task

### 🔧 Dependency Injection (GetIt)

All dependencies registered in `injection_container.dart`:
- Data sources
- Repositories
- Use cases
- Cubits

Benefits:
- Easy to test (mock dependencies)
- Centralized dependency management
- No service locator anti-pattern issues
- Clear dependency graph

### ✨ Best Practices Implemented

1. **Clean Architecture** - Separated concerns across layers
2. **SOLID Principles** - Single responsibility, Open/closed, etc.
3. **Dependency Inversion** - Depend on abstractions, not concretions
4. **State Management** - Reactive UI with Cubit
5. **Error Handling** - Try-catch blocks with user-friendly messages
6. **Null Safety** - Full null safety implementation
7. **Code Comments** - Clear documentation for complex logic
8. **Reusable Widgets** - DRY principle in UI components
9. **Type Safety** - Strong typing throughout codebase
10. **Immutability** - Immutable models and entities

### 📝 Task Model

```dart
class Task {
  final String id;           // UUID generated at creation
  final String title;        // Task description
  final bool isCompleted;    // Completion status
  final DateTime createdAt;  // Creation timestamp
}
```

### 🐛 Troubleshooting

**Problem**: Adapter not registered error
**Solution**: Run `flutter pub run build_runner build` to generate `task_model.g.dart`

**Problem**: Hive box not opening
**Solution**: Clear app cache or reinstall the app

**Problem**: Tasks not persisting
**Solution**: Ensure `TaskLocalDataSourceImpl.init()` is called in `main()`

### 📚 Learning Resources

- **Clean Architecture**: Uncle Bob's clean architecture principles
- **Hive**: Local NoSQL database for Flutter
- **Bloc/Cubit**: Reactive state management pattern
- **GetIt**: Service locator for dependency injection

### 🎯 Next Steps (Optional Enhancements)

- Add task categories/tags
- Add due dates and reminders
- Add search functionality
- Add priority levels
- Add task notes/descriptions
- Implement undo/redo functionality
- Add backup/export to JSON
- Implement task sorting options
- Add animations for task operations
- Add dark mode support

### 📄 License

This project is open source and available under the MIT License.

---

**Created**: June 11, 2026
**Flutter Version**: 3.12.0+
**Dart Version**: 3.12.0+
