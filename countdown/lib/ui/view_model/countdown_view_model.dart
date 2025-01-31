import 'dart:async';

class CountdownManager {
  static final CountdownManager _instance = CountdownManager._internal();
  factory CountdownManager() => _instance;
  CountdownManager._internal();

  Timer? _timer;
  final _controller = StreamController<void>.broadcast();

  Stream<void> get stream => _controller.stream;

  void start() {
    if (_timer?.isActive ?? false) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!_controller.isClosed) {
        _controller.add(null);
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
    _controller.close();
  }
}
