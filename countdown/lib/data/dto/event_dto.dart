class EventDto {
  final String id;
  final String name;
  final String? notes;
  final String? iconName;
  final DateTime dateTime;
  final List<String> tags;
  final String timezone;
  final bool isRepeating;

  EventDto({
    required this.id,
    required this.name,
    this.notes,
    this.iconName,
    required this.dateTime,
    this.tags = const [],
    required this.timezone,
    this.isRepeating = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'notes': notes,
      'iconName': iconName,
      'dateTime': dateTime.toIso8601String(),
      'tags': tags.join(','),
      'timezone': timezone,
      'isRepeating': isRepeating ? 1 : 0,
    };
  }

  factory EventDto.fromMap(Map<String, dynamic> map) {
    return EventDto(
      id: map['id'],
      name: map['name'],
      notes: map['notes'],
      iconName: map['iconName'],
      dateTime: DateTime.parse(map['dateTime']),
      tags: map['tags']
              ?.toString()
              .split(',')
              .where((s) => s.isNotEmpty)
              .toList() ??
          [],
      timezone: map['timezone'],
      isRepeating: map['isRepeating'] == 1,
    );
  }
}
