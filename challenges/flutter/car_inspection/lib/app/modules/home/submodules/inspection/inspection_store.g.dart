// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InspectionStore on _InspectionStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_InspectionStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_InspectionStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$inspectionsAtom =
      Atom(name: '_InspectionStoreBase.inspections', context: context);

  @override
  List<Inspection?>? get inspections {
    _$inspectionsAtom.reportRead();
    return super.inspections;
  }

  @override
  set inspections(List<Inspection?>? value) {
    _$inspectionsAtom.reportWrite(value, super.inspections, () {
      super.inspections = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
inspections: ${inspections}
    ''';
  }
}
