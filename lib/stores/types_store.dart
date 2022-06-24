import 'package:events_poster/src/models/event_type.dart';
import 'package:mobx/mobx.dart';

part 'types_store.g.dart';

class TypesStore = _TypesStore with _$TypesStore;

abstract class _TypesStore with Store {
  _TypesStore();

  @observable
  ObservableList<EventType> types = EventType.values.asObservable();

  @observable
  late EventType _selectedType = types[0];

  EventType get selectedType => _selectedType;

  @action
  void selectType(EventType eventType) {
    _selectedType = eventType;
  }
}
