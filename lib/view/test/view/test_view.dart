import '../../../core/base/state/base_state.dart';
import '../../../core/base/widget/base_widget.dart';
import '../viewmodel/test_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestView extends StatefulWidget {
  const TestView({Key key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.getData();
      },
      onPageBuilder: (context, value) {
        return scaffoldBody;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: floatingActionButtonIncrementNumber,
        body: textNumber,
      );

  FloatingActionButton get floatingActionButtonIncrementNumber {
    return FloatingActionButton(
      onPressed: () {
        viewModel.incrementNumber();
      },
    );
  }

  Center get textNumber {
    return Center(
      child: Observer(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                viewModel.number.toString(),
              ),
              Text(
                viewModel.testData != null
                    ? viewModel.testData.title != null
                        ? viewModel.testData.title
                        : ""
                    : "",
                style: TextStyle(color: Colors.red),
              ),
            ],
          );
        },
      ),
    );
  }
}
