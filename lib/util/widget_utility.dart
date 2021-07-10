import 'package:flutter/material.dart';

class WidgetUtility {
  static List<Widget> spreadWidgets(
    List<Widget> widgets, {
    bool flowHorizontal = true,
    Color background = Colors.transparent,
    EdgeInsets padding = EdgeInsets.zero,
    double interItemSpace = 1,
    double? width,
    double? height,
  }) {
    List<Widget> spacedWidgets = [];
    List<Widget> _widgets = WidgetUtility.childrenFilter(widgets);
    for (int index = 0; index < _widgets.length; index++) {
      spacedWidgets.add(_widgets[index]);
      if (index < (_widgets.length - 1)) {
        if (flowHorizontal) {
          spacedWidgets.add(SizedBox(
            width: interItemSpace, // widht of spacer
            child: Container(
              color: background,
              height: height,
              margin: EdgeInsets.only(top: padding.top, bottom: padding.bottom),
            ),
          ));
        } else {
          spacedWidgets.add(SizedBox(
            height: interItemSpace, // height of spacer
            child: Container(
              color: background,
              width: width,
              margin: EdgeInsets.only(left: padding.left, right: padding.right),
            ),
          ));
        }
      }
    }
    return spacedWidgets;
  }

  static List<Widget> childrenFilter(List<Widget> children) {
    return children.where(notNull).toList();
  }

  static bool notNull(Object o) => o != null;
}
