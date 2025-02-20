import '../../domain/models/countdown_event/countdown_event.dart';

abstract class CountdownRepository {
  Future<List<CountdownEvent>> getAllEvents();
  Future<CountdownEvent?> getEventById(String id);
  Future<List<CountdownEvent>> getActiveEvents();
  Future<void> saveEvent(CountdownEvent event);
  Future<void> deleteEvent(String id);
  Future<void> archiveEvent(String id);
  Stream<List<CountdownEvent>> watchActiveEvents();
}
