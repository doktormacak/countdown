sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Ok._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(Exception error) = Error._;
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Subclass of Result for errors
final class Error<T> extends Result<T> {
  const Error._(this.error);

  /// Returned error in result
  final Exception error;

  @override
  String toString() => 'Result<$T>.error($error)';
}

class EventsDatabaseException implements Exception {
  final String message;
  final dynamic cause;

  EventsDatabaseException(this.message, [this.cause]);

  @override
  String toString() =>
      'DatabaseException: $message${cause != null ? ' (Cause: $cause)' : ''}';
}

class EventNotFoundException implements Exception {
  final String eventId;

  EventNotFoundException(this.eventId);

  @override
  String toString() =>
      'EventNotFoundException: Event with id $eventId not found';
}

// Extension methods for Result type
extension ResultExtension<T> on Result<T> {
  T getOrThrow() {
    return switch (this) {
      Ok(value: final v) => v,
      Error(error: final e) => throw e,
    };
  }

  T? getOrNull() {
    return switch (this) {
      Ok(value: final v) => v,
      Error() => null,
    };
  }

  R fold<R>(
      R Function(T value) onSuccess, R Function(Exception error) onError) {
    return switch (this) {
      Ok(value: final v) => onSuccess(v),
      Error(error: final e) => onError(e),
    };
  }
}
