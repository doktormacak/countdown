import 'dart:async';

import 'package:countdown/data/dto/event_dto.dart';
import 'package:countdown/data/repository/countdown_repository.dart';
import 'package:countdown/data/services/events_database_service.dart';
import 'package:countdown/data/services/logger_service.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/utils/result.dart';

class CountdownRepositoryImpl implements CountdownRepository {
  final EventsDatabaseService _db;
  final LoggerService _logger;
  final _eventStreamController =
      StreamController<Result<List<CountdownEvent>>>.broadcast();

  CountdownRepositoryImpl(this._db, this._logger) {
    _logger.debug('Countdown repository initialized');
  }

  @override
  Future<Result<void>> archiveEvent(String id) async {
    _logger.debug('Archiving event: $id');
    try {
      final archived = await _db.archiveEvent(id);
      return archived.fold(
        (wasArchived) async {
          if (!wasArchived) {
            _logger.warning('Failed to archive event: $id');
            return Result.error(EventNotFoundException(id));
          }
          _logger.info('Event archived successfully: $id');
          await _notifyEventUpdates();
          return const Result.ok(null);
        },
        (error) => Result.error(
          EventsDatabaseException('Failed to archive event', error),
        ),
      );
    } catch (e, stack) {
      _logger.error('Failed to archive event: $id', e, stack);
      return Result.error(
        EventsDatabaseException('Failed to archive event', e),
      );
    }
  }

  @override
  Future<Result<void>> deleteEvent(String id) async {
    _logger.debug('Deleting event: $id');
    try {
      final deleted = await _db.deleteEvent(id);
      return deleted.fold(
        (wasDeleted) async {
          if (!wasDeleted) {
            _logger.warning('Failed to delete event: $id');
            return Result.error(EventNotFoundException(id));
          }
          _logger.info('Event deleted successfully: $id');
          await _notifyEventUpdates();
          return const Result.ok(null);
        },
        (error) => Result.error(
          EventsDatabaseException('Failed to delete event', error),
        ),
      );
    } catch (e, stack) {
      _logger.error('Failed to delete event: $id', e, stack);
      return Result.error(
        EventsDatabaseException('Failed to delete event', e),
      );
    }
  }

  @override
  Future<Result<List<CountdownEvent>>> getActiveEvents() async {
    _logger.debug('Getting active events');
    try {
      final activeEvents = await _db.getActiveEvents();
      return activeEvents.fold(
        (eventDtos) => Result.ok(
          eventDtos.map((dto) => dto.toDomain()).toList(),
        ),
        (error) => Result.error(error),
      );
    } catch (e, stack) {
      _logger.error('Failed to get active events', e, stack);
      return Result.error(
        EventsDatabaseException('Failed to get active events', e),
      );
    }
  }

  @override
  Future<Result<List<CountdownEvent>>> getAllEvents() async {
    _logger.debug('Getting all events');
    try {
      final events = await _db.getAllEvents();
      return events.fold(
        (eventDtos) => Result.ok(
          eventDtos.map((dto) => dto.toDomain()).toList(),
        ),
        (error) => Result.error(error),
      );
    } catch (e, stack) {
      _logger.error('Failed to get all events', e, stack);
      return Result.error(
        EventsDatabaseException('Failed to get all events', e),
      );
    }
  }

  @override
  Future<Result<CountdownEvent>> getEventById(String id) async {
    _logger.debug('Getting event by id: $id');
    try {
      final event = await _db.getEventById(id);
      return event.fold(
        (eventDto) => Result.ok(eventDto.toDomain()),
        (error) => Result.error(error),
      );
    } catch (e, stack) {
      _logger.error('Failed to get event by id: $id', e, stack);
      return Result.error(
          EventsDatabaseException('Failed to get event by id', e));
    }
  }

  @override
  Future<Result<void>> saveEvent(CountdownEvent event) async {
    _logger.debug('Saving event: ${event.id}');
    try {
      final dto = EventDTO.fromDomain(event);
      final result = await _db.insertEvent(dto);
      await result.fold(
        (_) async {
          _logger.info('Event saved successfully: ${event.id}');
          await _notifyEventUpdates();
        },
        (error) {
          _logger.error('Failed to save event: ${event.id}', error);
        },
      );
      return result;
    } catch (e, stack) {
      _logger.error('Failed to save event: ${event.id}', e, stack);
      return Result.error(EventsDatabaseException('Failed to save event', e));
    }
  }

  @override
  Stream<Result<List<CountdownEvent>>> watchActiveEvents() {
    _logger.debug('Starting to watch active events');
    _notifyEventUpdates();
    return _eventStreamController.stream;
  }

  Future<void> _notifyEventUpdates() async {
    _logger.debug('Notifying event updates');
    final eventsResult = await getActiveEvents();
    _eventStreamController.add(eventsResult);
  }

  Future<void> dispose() async {
    _logger.debug('Disposing repository');
    await _eventStreamController.close();
  }
}
