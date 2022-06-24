// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TypesStore on _TypesStore, Store {
  late final _$typesAtom = Atom(name: '_TypesStore.types', context: context);

  @override
  ObservableList<EventType> get types {
    _$typesAtom.reportRead();
    return super.types;
  }

  @override
  set types(ObservableList<EventType> value) {
    _$typesAtom.reportWrite(value, super.types, () {
      super.types = value;
    });
  }

  late final _$_selectedTypeAtom =
      Atom(name: '_TypesStore._selectedType', context: context);

  @override
  EventType get _selectedType {
    _$_selectedTypeAtom.reportRead();
    return super._selectedType;
  }

  @override
  set _selectedType(EventType value) {
    _$_selectedTypeAtom.reportWrite(value, super._selectedType, () {
      super._selectedType = value;
    });
  }

  late final _$_TypesStoreActionController =
      ActionController(name: '_TypesStore', context: context);

  @override
  void selectType(EventType eventType) {
    final _$actionInfo = _$_TypesStoreActionController.startAction(
        name: '_TypesStore.selectType');
    try {
      return super.selectType(eventType);
    } finally {
      _$_TypesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
types: ${types}
    ''';
  }
}
