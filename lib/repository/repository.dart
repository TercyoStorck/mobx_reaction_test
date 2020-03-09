import 'package:mobx/mobx.dart';
import 'package:mobx_reaction_test/service/service.dart';

part 'repository.g.dart';

class Repository = _RepositoryBase with _$Repository;

abstract class _RepositoryBase with Store {
  final Service _service;

  @observable
  String _data;
  @observable
  int _counter = 0;
  @observable
  String _error;

  _RepositoryBase(this._service) {
    _reactionDisposer = reaction(
      (_) => _counter,
      (_) => _fetchData(),
    );
  }

  String get data => _data;
  String get error => _error;

  _fetchData() {
    _service
        .fetchData()
        .then(
          _fetchDataSuccess,
        )
        .catchError(
          _fetchDataFailed,
        );
  }

  _fetchDataSuccess(String value) => _data = value;
  _fetchDataFailed(Exception e) => _error = e.toString();

  @action
  incrementCounter() => _counter++;

  ReactionDisposer _reactionDisposer;

  dispose() {
    _reactionDisposer();
  }
}
