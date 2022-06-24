// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_events_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesEventsStore on _FavoritesEventsStore, Store {
  Computed<bool>? _$favoritesIsEmptyComputed;

  @override
  bool get favoritesIsEmpty => (_$favoritesIsEmptyComputed ??= Computed<bool>(
          () => super.favoritesIsEmpty,
          name: '_FavoritesEventsStore.favoritesIsEmpty'))
      .value;

  late final _$favoritesMapAtom =
      Atom(name: '_FavoritesEventsStore.favoritesMap', context: context);

  @override
  ObservableMap<String, Event> get favoritesMap {
    _$favoritesMapAtom.reportRead();
    return super.favoritesMap;
  }

  @override
  set favoritesMap(ObservableMap<String, Event> value) {
    _$favoritesMapAtom.reportWrite(value, super.favoritesMap, () {
      super.favoritesMap = value;
    });
  }

  late final _$_FavoritesEventsStoreActionController =
      ActionController(name: '_FavoritesEventsStore', context: context);

  @override
  void loadEventsFromHive() {
    final _$actionInfo = _$_FavoritesEventsStoreActionController.startAction(
        name: '_FavoritesEventsStore.loadEventsFromHive');
    try {
      return super.loadEventsFromHive();
    } finally {
      _$_FavoritesEventsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onFavoritePress(Event event) {
    final _$actionInfo = _$_FavoritesEventsStoreActionController.startAction(
        name: '_FavoritesEventsStore.onFavoritePress');
    try {
      return super.onFavoritePress(event);
    } finally {
      _$_FavoritesEventsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritesMap: ${favoritesMap},
favoritesIsEmpty: ${favoritesIsEmpty}
    ''';
  }
}
