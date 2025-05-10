import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/Note_style.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/pages/settings_page.dart';
import 'package:provider/provider.dart';

class NotesPages extends StatefulWidget {
  const NotesPages({super.key});

  @override
  State<NotesPages> createState() => _NotesPagesState();
}

class _NotesPagesState extends State<NotesPages> {
  //tex conroller
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    return readNotes();
  }

  void createNote() {
    showDialog(
      context: context,
      builder:
          (conyext) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            content: TextField(controller: textController),
            actions: [
              MaterialButton(
                onPressed: () {
                  context.read<NoteDatabase>().notesTuzuu(textController.text);
                  textController.clear();
                  Navigator.pop(context);
                },
                child: Text('Create'),
              ),
            ],
          ),
    );
  }

  void readNotes() {
    context.read<NoteDatabase>().notesOkuu();
  }

  //ubdate note
  void ubdateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,

            title: Text('Ubdate Note'),
            content: TextField(controller: textController),
            actions: [
              MaterialButton(
                onPressed: () {
                  context.read<NoteDatabase>().jagyloonote(
                    note.id,
                    textController.text,
                  );
                  textController.clear();
                  Navigator.pop(context);
                },
                child: Text('Update'),
              ),
            ],
          ),
    );
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().notesDelete(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDataBase = context.watch<NoteDatabase>();

    List<Note> currentNotes = noteDataBase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Notes',
          style: GoogleFonts.dmSerifText(
            fontSize: 30,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];

                return NoteStyle(
                  text: note.text,
                  onEditPressed: () => ubdateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
