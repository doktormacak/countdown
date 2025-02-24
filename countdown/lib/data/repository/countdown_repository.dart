import '../../domain/models/countdown_event/countdown_event.dart';
import '../../utils/result.dart';

abstract class CountdownRepository {
  Future<Result<List<CountdownEvent>>> getAllEvents();
  Future<Result<CountdownEvent>> getEventById(String id);
  Future<Result<List<CountdownEvent>>> getActiveEvents();
  Future<Result<void>> saveEvent(CountdownEvent event);
  Future<Result<void>> deleteEvent(String id);
  Future<Result<void>> archiveEvent(String id);
  Stream<Result<List<CountdownEvent>>> watchActiveEvents();
}
