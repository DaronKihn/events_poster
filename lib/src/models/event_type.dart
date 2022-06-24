class EventType {
  final String value;
  final String name;

  EventType({required this.value, required this.name});

  const EventType._(this.value, this.name);

  static const EventType concert = EventType._('concert', 'Concerts');
  static const EventType sports = EventType._('sports', 'Sports');
  static const EventType comedy = EventType._('comedy', 'Comedy');
  static const EventType literary = EventType._('literary', 'Literary');

  static const List<EventType> values = [concert, sports, comedy, literary];
}
