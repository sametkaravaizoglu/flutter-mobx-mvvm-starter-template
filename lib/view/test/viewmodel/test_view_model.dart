import 'package:mobx/mobx.dart';

import '../../../core/init/network/network_manager.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  @observable
  int number = 0;

  @observable
  TestModel testData;

  @action
  void incrementNumber() {
    number++;
  }

  @action
  getData() {
    NetworkManager.instance
        .get<TestModel>(
      "/v1/2641eca4-d85d-421c-b9ef-697016998bb8",
      model: TestModel(),
    )
        .then(
      (value) {
        testData = testModelFromJson(value);
      },
    );
  }

  //@computed
  //bool get isEven => number % 2 == 0 ? true : false;
}
