import 'package:flutter/material.dart';
import 'package:go_green/models/notes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NoteProvider extends ChangeNotifier {
  List<Notes> _note = [];
  List<Notes> get note => _note;

  void addnotes(Notes notess) {
    _note.add(notess);
    notifyListeners();
    saveNotesToPrefs();
  }

  void deleteNote(int index) {
    _note.removeAt(index);
    notifyListeners();
    saveNotesToPrefs();
  }

  void updateNote(int index, Notes updatedNote) {
    if (index >= 0 && index < _note.length) {
      _note[index] = updatedNote;
      notifyListeners();
      saveNotesToPrefs();
    }
  }

  Future<void> saveNotesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List notesJson = _note.map((note) => note.toJson()).toList();
    prefs.setString('notes', jsonEncode(notesJson));
  }

  Future<void> loadNotesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? notesString = prefs.getString('notes');
    if (notesString != null) {
      List<dynamic> notesJson = jsonDecode(notesString);
      _note = notesJson.map((json) => Notes.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
