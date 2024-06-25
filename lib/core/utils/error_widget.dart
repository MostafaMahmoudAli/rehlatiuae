import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget
{
  const ErrorsWidget({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context)
  {
    return ScaffoldMessenger(
      child: SnackBar(
        content: Text(error,),
      ),
    );
  }
}
