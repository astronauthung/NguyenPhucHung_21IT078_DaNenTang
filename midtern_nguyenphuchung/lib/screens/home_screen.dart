import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midtern_nguyenphuchung/screens/signin_screen.dart';
import 'package:midtern_nguyenphuchung/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Enter your note',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                firestoreService.addNote(textController.text);
              } else {
                firestoreService.updateNote(docID, textController.text);
              }
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agriculture Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  elevation: 3, // Adds shadow to the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    title: Text(
                      noteText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Update button
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: const Icon(Icons.edit, color: Colors.blue),
                        ),
                        // Delete button
                        IconButton(
                          onPressed: () => firestoreService.deleteNote(docID),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
