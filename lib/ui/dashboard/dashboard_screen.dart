import 'package:flutter/material.dart';
import 'package:test_app/ui/widget/app_button.dart';
import 'package:test_app/util/string_utility.dart';
import 'package:test_app/util/widget_utility.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<TextEditingController> textControllers = [];
  ValueNotifier<List<TextField>> textFields =
      ValueNotifier<List<TextField>>([]);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: WidgetUtility.spreadWidgets(
                [
                  ValueListenableBuilder<List<TextField>>(
                    valueListenable: textFields,
                    builder: (context, fields, _) {
                      if (fields.isNotEmpty) {
                        return Column(
                          children: WidgetUtility.spreadWidgets(
                            fields,
                            interItemSpace: 12,
                            flowHorizontal: false,
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                  AppButton(
                    onPressed: () {
                      _onAddViewClick(StringUtility.generateRandomString());
                    },
                    title: 'Add View',
                  )
                ],
                interItemSpace: 12,
                flowHorizontal: false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onAddViewClick(String viewId) {
    TextEditingController controller = TextEditingController(text: viewId);
    textControllers.add(controller);
    textFields.value.add(TextField(controller: controller));
    textFields.notifyListeners();
  }
}
