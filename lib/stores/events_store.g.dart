// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventsStore on _EventsStore, Store {
  Computed<EventsStoreState>? _$stateComputed;

  @override
  EventsStoreState get state =>
      (_$stateComputed ??= Computed<EventsStoreState>(() => super.state,
              name: '_EventsStore.state'))
          .value;

  late final _$eventsAtom = Atom(name: '_EventsStore.events', context: context);

  @override
  ObservableList<Event> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(ObservableList<Event> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_EventsStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_eventsFutureAtom =
      Atom(name: '_EventsStore._eventsFuture', context: context);

  @override
  ObservableFuture<List<Event>>? get _eventsFuture {
    _$_eventsFutureAtom.reportRead();
    return super._eventsFuture;
  }

  @override
  set _eventsFuture(ObservableFuture<List<Event>>? value) {
    _$_eventsFutureAtom.reportWrite(value, super._eventsFuture, () {
      super._eventsFuture = value;
    });
  }

  late final _$loadEventsByTypeAsyncAction =
      AsyncAction('_EventsStore.loadEventsByType', context: context);

  @override
  Future<void> loadEventsByType() {
    return _$loadEventsByTypeAsyncAction.run(() => super.loadEventsByType());
  }

  @override
  String toString() {
    return '''
events: ${events},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
