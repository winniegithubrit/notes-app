import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class StorageService {
  static const String _notesKey = 'notes';

  // Get all notes
  Future<List<Note>> getNotes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? notesJson = prefs.getString(_notesKey);
      print('Raw data: $notesJson');
      
      if (notesJson == null || notesJson.isEmpty) {
        return [];
      }

      final List<dynamic> notesList = json.decode(notesJson);
      final notes = notesList.map((json) => Note.fromJson(json)).toList();
      return notes;
    } catch (e) {
      return [];
    }
  }

  // Save all notes
  Future<bool> saveNotes(List<Note> notes) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> notesJson = 
          notes.map((note) => note.toJson()).toList();
      final String encodedNotes = json.encode(notesJson);
      final success = await prefs.setString(_notesKey, encodedNotes);
      
      if (success) {
        // Verify the save
        final savedData = prefs.getString(_notesKey);
        print('Save successful! Verification: ${savedData != null}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Add a new note
  Future<bool> addNote(Note note) async {
    final notes = await getNotes();
    notes.add(note);
    final success = await saveNotes(notes);
    return success;
  }
  Future<bool> updateNote(Note updatedNote) async {
    final notes = await getNotes();
    final index = notes.indexWhere((note) => note.id == updatedNote.id);
    
    if (index != -1) {
      notes[index] = updatedNote;
      final success = await saveNotes(notes);
      return success;
    }
    return false;
  }
  Future<bool> deleteNote(String noteId) async {
    final notes = await getNotes();
    final initialLength = notes.length;
    notes.removeWhere((note) => note.id == noteId);
    
    if (notes.length < initialLength) {
      final success = await saveNotes(notes);
      return success;
    }
    return false;
  }
  Future<Note?> getNoteById(String noteId) async {
    final notes = await getNotes();
    try {
      return notes.firstWhere((note) => note.id == noteId);
    } catch (e) {
      print('Note not found: $noteId');
      return null;
    }
  }

  // Clear all notes 
  Future<bool> clearAllNotes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final success = await prefs.remove(_notesKey);
      return success;
    } catch (e) {
      return false;
    }
  }

  // Test storage functionality
  Future<void> testStorage() async {
    final prefs = await SharedPreferences.getInstance();
    // Test write
    await prefs.setString('test_key', 'test_value');
    final testValue = prefs.getString('test_key');
    
    if (testValue == 'test_value') {
      print('Storage test passed!');
    } else {
      print('Storage test failed!');
    }
    await prefs.remove('test_key');
  }
}