import 'package:flutter/material.dart';
import 'package:go_green/models/notes.dart';
import 'package:go_green/screens/edit_note_screen.dart';

class NoteCard extends StatelessWidget {
  final Notes note;
  final VoidCallback? onTap;
  final int index;
  final VoidCallback? onDelete;

  const NoteCard({
    super.key,
    required this.note,
    this.onTap,
    required this.index,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    //  final formattedDate = DateFormat('MMM d, yyyy – hh:mm a').format(note.timestamp);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: const Color(0xFFEDE7F6), // Light purple background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        title: Text(
          note.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF4A148C), // Deep purple text
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.description,
              style: TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: SizedBox(
          width: 96,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditNoteScreen(index: index, Note: note),
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: Color(0xFF6A1B9A),
                ), // Purple edit icon
              ),
              IconButton(
                onPressed: onDelete ?? () {},
                icon: Icon(Icons.delete, color: Colors.red[300]),
                tooltip: 'Delete',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
