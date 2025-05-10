import 'package:isar/isar.dart';

part 'note.g.dart';

// This is the model class for the Note object

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text; // The text of the note
}
