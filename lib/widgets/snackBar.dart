import 'package:flutter/material.dart';

class snackBar extends StatefulWidget {
  final String  description;
  final SnackBarAction? snackBarAction;

  const snackBar({super.key, required this.description, this.snackBarAction});

  @override
  State<snackBar> createState() => _snackBarState();
}

class _snackBarState extends State<snackBar> {
  @override
  Widget build(BuildContext context) {
    return  SnackBar(
      content: Text(widget.description),
      showCloseIcon: true,
      width: MediaQuery.of(context).size.width*.9,
      behavior: SnackBarBehavior.floating,
      action: widget.snackBarAction,
      duration: const Duration(seconds: 3),
      actionOverflowThreshold: 5.0,
    );
  }
}
