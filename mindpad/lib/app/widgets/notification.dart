import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String contentText;
  final void Function() confirmFunction;
  final void Function() declineFunction;

  NotificationWidget({
    required this.contentText,
    required this.confirmFunction,
    required this.declineFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        contentText,
      ),
      actions: [
        TextButton(
          onPressed: declineFunction,
          child: Text("No"),
        ),
        TextButton(
          onPressed: confirmFunction,
          child: Text("Yes"),
        ),
      ],
    );
  }
}
