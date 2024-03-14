import 'package:diary_app/repository/notes_repository.dart';
import 'package:diary_app/screens/add-note/add_note_screen.dart';
import 'package:diary_app/screens/home/widgets/item_node.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Diary'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => setState(() {}),
              icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: NoteRepository.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(child: Text("Empty"),);
            }
            return ListView(
              padding: EdgeInsets.all(15),
              children: [
                for (var note in snapshot.data!)
                  ItemNote(note: note,)
              ],
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddNoteScreen()));
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
