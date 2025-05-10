import 'package:flutter/material.dart';
import 'package:notes_app/components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteStyle extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteStyle({
    super.key,
    required this.text,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(text),

        trailing: Builder(
          builder:
              (context) => IconButton(
                onPressed:
                    () => showPopover(
                      width: 100,
                      height: 100,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      context: context,
                      bodyBuilder:
                          (context) => NoteSettings(
                            onEditTap: onEditPressed,
                            onDeleteTap: onDeletePressed,
                          ),
                    ),
                icon: Icon(Icons.more_vert),
              ),
        ),
        // trailing: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(onPressed: onEditPressed, icon: Icon(Icons.edit)),
        //     IconButton(onPressed: onDeletePressed, icon: Icon(Icons.delete)),
        //   ],
        // ),
      ),
    );
  }
}
