import 'package:diary_app/screens/add-note/add_note_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/note.dart';
class ItemNote extends StatelessWidget {
  final Note note;
  const ItemNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => AddNoteScreen(note: note,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red
              ),
              child: Column(
                children: [
                  Text(
                      DateFormat(DateFormat.ABBR_MONTH).format(note.createdAt),
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                      DateFormat(DateFormat.DAY).format(note.createdAt),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                      note.createdAt.year.toString(),
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              note.title,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          DateFormat(DateFormat.HOUR_MINUTE).format(note.createdAt),
                        style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    ),
                    Text(
                        note.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        height: 1.5
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
