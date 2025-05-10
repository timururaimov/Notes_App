import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;

  const NoteSettings({
    super.key,
    required this.onDeleteTap,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Edit',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
