import '../error/failures.dart';

class Result<T> {
  final T? value;
  final Failure? failure;

  const Result.success(this.value) : failure = null;
  const Result.failure(this.failure) : value = null;

  bool get isSuccess => failure == null;
  bool get isFailure => failure != null;
}

abstract class UseCase<Type, Params> {
  Future<Result<Type>> call(Params params);
}

class NoParams {}
