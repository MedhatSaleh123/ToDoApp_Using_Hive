# Flutter Learning Projects

This repository contains multiple Flutter projects demonstrating clean architecture, state management, and best practices.

## 📱 Projects

### 1. Authentication Module (`features/auth/`)
Clean architecture authentication system with:
- **Cubit** state management
- **Login/Logout** functionality
- **ChangeNotifier** to **Cubit** migration examples

**Location**: `lib/features/auth/`

### 2. To-Do App (`features/todo/`) ⭐ NEW
Production-ready task management application with:
- **Clean Architecture** - Organized 3-layer structure
- **Hive** - Local NoSQL database for persistence
- **Cubit** - Reactive state management
- **Material Design 3** - Modern UI components
- **GetIt** - Dependency injection container

**Location**: `lib/features/todo/`
**Setup Guide**: `lib/features/todo/README.md`

## 🚀 Quick Start

### Prerequisites
- Flutter 3.12.0+
- Dart 3.12.0+

### Installation

1. **Clone/Download project**
   ```bash
   cd test
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters** (for To-Do app)
   ```bash
   flutter pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Project Structure

```
lib/
├── core/                          # Shared core utilities
│   ├── error/
│   │   └── failures.dart         # Error handling classes
│   └── usecases/
│       └── usecase.dart          # Base usecase classes
│
├── features/
│   ├── auth/                     # Authentication feature
│   │   ├── data/                 # Data layer
│   │   ├── domain/               # Business logic layer
│   │   └── presentation/         # UI layer
│   │
│   └── todo/                     # To-Do management feature
│       ├── data/                 # Data layer (Hive models)
│       ├── domain/               # Business logic (entities, repos, usecases)
│       └── presentation/         # UI layer (Cubit, pages, widgets)
│
├── injection_container.dart      # Dependency injection setup (GetIt)
└── main.dart                     # App entry point
```

## 🏛️ Architecture Layers

### Clean Architecture Pattern
Each feature is organized into three layers:

#### 1. **Data Layer** (`data/`)
- Models (database representations)
- Data sources (local/remote access)
- Repository implementations
- No business logic

#### 2. **Domain Layer** (`domain/`)
- Entities (business models)
- Repository interfaces (contracts)
- Use cases (business operations)
- No framework dependencies

#### 3. **Presentation Layer** (`presentation/`)
- Cubits (state management)
- States (UI states)
- Pages (screens)
- Widgets (reusable components)
- Handles user interaction

## 🔄 Data Flow Pattern

```
┌─────────────────┐
│   UI Layer      │  ← User Interaction
│  (Widgets)      │
└────────┬────────┘
         ↓
┌─────────────────┐
│   State Mgmt    │  ← Cubit (handles logic)
│   (Cubit)       │
└────────┬────────┘
         ↓
┌─────────────────┐
│  Use Cases      │  ← Business operations
└────────┬────────┘
         ↓
┌─────────────────┐
│  Repositories   │  ← Abstractions
└────────┬────────┘
         ↓
┌─────────────────┐
│  Data Sources   │  ← Database/API access
└────────┬────────┘
         ↓
┌─────────────────┐
│  Hive / API     │  ← Persistence layer
└─────────────────┘
```

## 📚 Key Concepts

### Clean Architecture Benefits
- ✅ **Testability** - Easy to unit test each layer
- ✅ **Maintainability** - Clear separation of concerns
- ✅ **Scalability** - Easy to add new features
- ✅ **Flexibility** - Easy to swap implementations
- ✅ **Reusability** - Shared core logic

### State Management (Cubit)
- **Simpler than BLoC** - Less boilerplate
- **Reactive** - Automatically rebuilds UI on state changes
- **Testable** - Easy to test state transitions
- **Centralized** - All logic in one place

### Dependency Injection (GetIt)
- **Centralized** - All dependencies in one container
- **Testable** - Easy to inject mocks
- **Type-safe** - Compile-time checking
- **Performant** - Singleton pattern supported

## 🔌 Dependencies

### Core Packages
```yaml
flutter_bloc: ^8.1.2         # State management
hive: ^2.2.3                 # Local database
hive_flutter: ^1.1.0         # Flutter integration
get_it: ^7.6.0               # Dependency injection
uuid: ^4.0.0                 # ID generation
equatable: ^2.0.5            # Value equality
```

### Code Generation
```yaml
hive_generator: ^2.0.1       # Generate adapters
build_runner: ^2.4.6         # Run code generation
```

## 💡 Design Patterns Used

1. **Repository Pattern** - Abstract data access
2. **Singleton Pattern** - Single instance objects (GetIt)
3. **Factory Pattern** - Object creation (Use Cases)
4. **Dependency Injection** - Loose coupling
5. **Observer Pattern** - State change notifications (Cubit)

## 🧪 Testing Approach

Each layer can be tested independently:

```dart
// Test Use Cases
test('CreateTaskUseCase creates task', () async {
  // Mock repository
  // Call use case
  // Verify repository called
});

// Test Repositories
test('TaskRepositoryImpl converts model to entity', () {
  // Create model
  // Call repository
  // Verify entity returned
});

// Test Cubits
blocTest<TodoCubit, TodoState>(
  'emits states when task added',
  build: () => cubit,
  act: (cubit) => cubit.addTask('Test'),
  expect: () => [TodoLoadingState(), TodoLoadedState(...)],
);
```

## 🎯 Best Practices Implemented

- ✅ **Null Safety** - Full null-safety throughout
- ✅ **Error Handling** - Try-catch with user messages
- ✅ **Type Safety** - Strong typing
- ✅ **Documentation** - Comments explaining logic
- ✅ **Code Organization** - Logical file structure
- ✅ **Immutability** - Models are immutable
- ✅ **SOLID Principles** - Clean, maintainable code
- ✅ **DRY** - Don't repeat yourself
- ✅ **KISS** - Keep it simple & stupid
- ✅ **Comments** - Explain WHY, not WHAT

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| **Adapter not registered** | Run `flutter pub run build_runner build` |
| **Hive box not opening** | Clear app cache or reinstall |
| **Null pointer exception** | Check null safety annotations |
| **State not updating** | Verify Cubit is provided in BlocProvider |
| **Dependency not found** | Verify registration in `injection_container.dart` |

## 📖 Learning Resources

- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter BLoC Library](https://bloclibrary.dev/)
- [Hive Documentation](https://docs.hivedb.dev/)
- [GetIt Package](https://pub.dev/packages/get_it)
- [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)

## 🎓 What You'll Learn

1. **Architecture** - How to structure Flutter apps for scale
2. **State Management** - Using Cubit effectively
3. **Database** - Local storage with Hive
4. **Dependency Injection** - Using GetIt
5. **Design Patterns** - Repository, Factory, Singleton
6. **Testing** - How to test each layer
7. **Best Practices** - Clean, maintainable code
8. **UI/UX** - Material Design 3 components

## 🚀 Next Steps

1. **Run the To-Do app** and explore the features
2. **Read the code** - Follow the data flow
3. **Modify features** - Try editing the code
4. **Add new features** - Practice the pattern
5. **Write tests** - Test your implementations

## 📝 Notes

- This is an educational project demonstrating best practices
- Code is production-ready but simplified for learning
- All files include detailed comments explaining logic
- Beginner-friendly but follows professional patterns

## 📄 License

This project is open source and available under the MIT License.

---

**Last Updated**: June 11, 2026
**Flutter Version**: 3.12.0+
**Dart Version**: 3.12.0+

**Project Maintainer**: Flutter Learning Projects
