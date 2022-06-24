import 'package:events_poster/repositories/events_repository.dart';
import 'package:events_poster/src/models/event.dart';
import 'package:events_poster/stores/types_store.dart';
import 'package:mobx/mobx.dart';

part 'events_store.g.dart';

class EventsStore = _EventsStore with _$EventsStore;

enum EventsStoreState { initial, loading, loaded, failure }

abstract class _EventsStore with Store {
  final EventsRepository _eventsRepository;
  final TypesStore _typesStore;
  final List<ReactionDisposer> _disposers = [];

  _EventsStore(this._eventsRepository, this._typesStore) {
    loadEventsByType();

    _disposers.add(
      reaction(
        (_) => _typesStore.selectedType,
        (_) => loadEventsByType(),
      ),
    );
  }

  @observable
  ObservableList<Event> events = <Event>[].asObservable();

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<List<Event>>? _eventsFuture;

  @computed
  EventsStoreState get state {
    if (_eventsFuture == null) {
      return EventsStoreState.initial;
    }
    if (_eventsFuture!.status == FutureStatus.rejected) {
      return EventsStoreState.failure;
    }
    return _eventsFuture!.status == FutureStatus.pending
        ? EventsStoreState.loading
        : EventsStoreState.loaded;
  }

  @action
  Future<void> loadEventsByType() async {
    try {
      errorMessage = null;
      _eventsFuture =
          ObservableFuture(_eventsRepository.fetchEventsByType(_typesStore.selectedType.value));
      events = await _eventsFuture!.then((value) => value.asObservable());
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}
