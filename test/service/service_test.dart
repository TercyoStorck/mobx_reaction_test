import 'package:flutter_test/flutter_test.dart';
import 'package:mobx_reaction_test/service/service.dart';

main() {
  Service _service;

  setUpAll(() {
    _service = Service();
  });

  test("when fetch data, return Done!", () async {
    final result = await _service.fetchData();
    expect(result, "Done!");
  });
}