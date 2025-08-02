import 'package:flutter/material.dart';
import 'package:go_green/models/notes.dart';
import 'package:go_green/provider/note_provider.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatefulWidget {
  final int index;
  final Notes Note;

  const EditNoteScreen({super.key, required this.index, required this.Note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.Note.title);
    _descController = TextEditingController(text: widget.Note.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void updateNote() {
    final String updatedTitle = _titleController.text.trim();
    final String updatedDesc = _descController.text.trim();

    if (updatedTitle.isEmpty || updatedDesc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Both title & description are required')),
      );
      return;
    }

    final updatedNote = Notes(title: updatedTitle, description: updatedDesc);

    Provider.of<NoteProvider>(
      context,
      listen: false,
    ).updateNote(widget.index, updatedNote);

    Navigator.pop(context);
  }

  void deleteNote() {
    Provider.of<NoteProvider>(context, listen: false).deleteNote(widget.index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C), // Deep slate background
      appBar: AppBar(
        title: const Text('Edit Note'),
        backgroundColor: const Color(0xFF512DA8), // Deep Purple 700
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: deleteNote,
            tooltip: 'Delete Note',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(color: Color(0xFFBA68C8)), // Accent
                filled: true,
                fillColor: const Color(0xFF2A2A40), // Dark fill
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _descController,
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: const TextStyle(color: Color(0xFFBA68C8)),
                filled: true,
                fillColor: const Color(0xFF2A2A40),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: updateNote,
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'Update Note',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF7E57C2,
                  ), // Light purple button
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
