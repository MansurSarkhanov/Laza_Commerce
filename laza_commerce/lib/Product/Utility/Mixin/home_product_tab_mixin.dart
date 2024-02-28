import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Feature/Screens/Home/Tabs/product_tab.dart';

mixin HomeProductTabMixin on State<ProductTab> {
  DateTime date = DateTime.now();
  late var formattedDateStart;
  late var formattedDateEnd;
  @override
  void initState() {
    super.initState();
    formattedDateStart = DateFormat('d-MMM-yyyy').format(date);
    formattedDateEnd = DateFormat('d-MMM-yyyy').format(date);
  }
}
