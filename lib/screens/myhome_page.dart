import 'package:flutter/material.dart';
import 'package:go_green/provider/note_provider.dart';
import 'package:go_green/widget/note_card.dart';
import 'package:provider/provider.dart';
import 'addnotes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NoteProvider>(context).note;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        title: const Text(
          'Note Keeper',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        elevation: 8,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(0.4),
      ),

      body: notes.isEmpty
          ? const EmptyStateWidget()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: notes.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return NoteCard(
                  note: notes[index],
                  onTap: () {
                    // You can open note detail screen here
                  },
                  onDelete: () {
                    Provider.of<NoteProvider>(
                      context,
                      listen: false,
                    ).deleteNote(index);
                  },
                  index: index,
                );
              },
            ),

      floatingActionButton: Tooltip(
        message: 'Add a new note',
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(6),
        ),
        textStyle: const TextStyle(color: Colors.white),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF7B1FA2),
          foregroundColor: Colors.white,
          elevation: 8,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Addnotes()),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.add, size: 28),
        ),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.note_alt_outlined, size: 70, color: Colors.white24),
            SizedBox(height: 20),
            Text(
              'No Notes Added Yet!',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
