import 'package:countdown/data/services/logger_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin LoggingMixin on AutoDisposeAsyncNotifier<dynamic> {
  LoggerService get logger => ref.read(loggerProvider);
}

mixin LoggingNotifierMixin on AsyncNotifier<dynamic> {
  LoggerService get logger => ref.read(loggerProvider);
}
