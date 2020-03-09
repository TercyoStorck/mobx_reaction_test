import 'package:mobx/mobx.dart';
import 'package:mobx_reaction_test/repository/repository.dart';

part 'store.g.dart';

class ViewStore = _ViewStoreBase with _$ViewStore;

abstract class _ViewStoreBase with Store {
  final Repository _repository;

  _ViewStoreBase(this._repository);

  @computed
  String get data => _repository.data;
  @computed
  String get error => _repository.error;

  void incrementCounter() => _repository.incrementCounter;
}