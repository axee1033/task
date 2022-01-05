import 'package:flutter/material.dart';
import 'package:task/utils/style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

loadingAlert(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        backgroundColor: Colors.white,
        content: LoadingIndicator(
          title: "جاري التحميل",
        ),
      );
    },
  );
}

class LoadingIndicator extends StatelessWidget {
  final String title;
  LoadingIndicator({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              child: Container(
                child: const SpinKitThreeInOut(
                  color: primaryColor,
                ),
              ),
              padding: const EdgeInsets.only(bottom: 16)),
          Padding(
            child: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.only(bottom: 4),
          ),
        ],
      ),
    );
  }
}
