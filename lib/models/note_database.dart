import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  //маалымат базасын инициализациялоо

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // list of notes
  final List<Note> currentNotes = [];

  //түзүү

  Future<void> notesTuzuu(String textFromUser) async {
    final jagyNote = Note()..text = textFromUser;

    //маалымат базасын cактоо

    await isar.writeTxn(() => isar.notes.put(jagyNote));
    //маалымат базасынан окуу
    notesOkuu();
  }

  //окуу

  Future<void> notesOkuu() async {
    List<Note> jagyNote = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(jagyNote);
    notifyListeners();
  }

  //жанылоо
  Future<void> jagyloonote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await notesOkuu();
    }
  }

  //удалить этүү

  Future<void> notesDelete(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await notesOkuu();
  }
}
