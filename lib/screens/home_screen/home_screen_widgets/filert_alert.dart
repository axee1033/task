import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/style.dart';

List<String> days = List.generate(30, (index) => (index + 1).toString());
String selectedDay = days[0];
List<String> months = List.generate(12, (index) => (index + 1).toString());
String selectedmonth = months[0];
List<String> years = List.generate(30, (index) {
  if (index.toString().length > 1) {
    return "20" + (index + 1).toString();
  } else {
    return "200" + (index + 1).toString();
  }
});
String selectedYear = years[0];
void filterAlert({required BuildContext context}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(builder: (context, selectionSetter) {
            return Container(
              height: getProportionateScreenHeight(180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("من تاريخ"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<String>(
                        items: days.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: selectedDay,
                        onChanged: (value) {
                          selectedDay = value!;
                          selectionSetter(() {});
                        },
                      ),
                      DropdownButton<String>(
                        items: months.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: selectedmonth,
                        onChanged: (value) {
                          selectedmonth = value!;
                          selectionSetter(() {});
                        },
                      ),
                      DropdownButton<String>(
                        items: years.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: selectedYear,
                        onChanged: (value) {
                          selectedYear = value!;
                          selectionSetter(() {});
                        },
                      ),
                    ],
                  ),
                  Text("الي تاريخ"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<String>(
                        items: days.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: selectedDay,
                        onChanged: (value) {
                          selectedDay = value!;
                          selectionSetter(() {});
                        },
                      ),
                      DropdownButton<String>(
                        items: months.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: selectedmonth,
                        onChanged: (value) {
                          selectedmonth = value!;
                          selectionSetter(() {});
                        },
                      ),
                      DropdownButton<String>(
                        items: years.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: selectedYear,
                        onChanged: (value) {
                          selectedYear = value!;
                          selectionSetter(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          actions: [
            Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "بحث",
                      style: TextStyle(color: redColor),
                    )))
          ],
        );
      });
}
