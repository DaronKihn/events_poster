import 'package:events_poster/src/models/event.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

part 'favorites_events_store.g.dart';

class FavoritesEventsStore = _FavoritesEventsStore with _$FavoritesEventsStore;

abstract class _FavoritesEventsStore with Store {
  _FavoritesEventsStore() {
    loadEventsFromHive();
  }
  @observable
  ObservableMap<String, Event> favoritesMap = ObservableMap<String, Event>();

  @computed
  bool get favoritesIsEmpty {
    return favoritesMap.isEmpty;
  }

  // @computed
  // bool get isFavorite(String id) {
  //   return favoritesMap.containsKey(id);
  // }

  @action
  void loadEventsFromHive() {
    final favoritesEvents = Hive.box<Event>('favorites');
    favoritesMap = {
      for (var item in favoritesEvents.keys) item.toString(): favoritesEvents.get(item) as Event
    }.asObservable();
  }

  @action
  void onFavoritePress(Event event) {
    final favoritesEvents = Hive.box<Event>('favorites');
    if (favoritesMap.containsKey(event.id.toString())) {
      favoritesEvents.delete(event.id.toString());
    } else {
      favoritesEvents.put(event.id.toString(), event);
    }
    favoritesMap = {
      for (var item in favoritesEvents.keys) item.toString(): favoritesEvents.get(item) as Event
    }.asObservable();
  }
}
