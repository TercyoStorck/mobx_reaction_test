import 'package:flutter_test/flutter_test.dart';
import 'package:mobx_reaction_test/repository/repository.dart';
import 'package:mockito/mockito.dart' as mockito;

import '../mocks.dart';

main() {
  Repository _repository;

  ServiceMock _service;

  setUpAll(() {
    _service = ServiceMock();
    _repository = Repository(_service);
  });

  test("problem 2", () async {
    mockito.when(_service.fetchData()).thenAnswer((_) => Future.value("Done!"));

    _repository.incrementCounter();

    //If I delay here the test will pass
    //await Future.delayed(Duration(seconds: 1));

    final data = _repository.data;

    expect(data, "Done!");
  });
}
