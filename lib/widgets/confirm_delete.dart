import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  final VoidCallback? onPressed;
  const DeleteAlertDialog({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      title: Text('Delete Task?'),
      content: Text('Task will be deleted!'),
      actions: [
        TextButton(
          child: Text(
            'CANCEL',
          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text(
            'DELETE',
          ),
           onPressed: () 
            =>onPressed,
        )
      ],
    );
  }
}
