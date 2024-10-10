// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';

// class FirestoreService {
//   final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

//   Future<void> addNote(String note, String type, String? imageUrl) {
//     return notes.add({
//       'note': note,
//       'type': type,
//       'imageUrl': imageUrl,
//       'timestamp': Timestamp.now(),
//     });
//   }

//   Stream<QuerySnapshot> getNotesStream() {
//     return notes.orderBy('timestamp', descending: true).snapshots();
//   }

//   Future<void> updateNote(String docID, String newNote, String type, String? imageUrl) {
//     return notes.doc(docID).update({
//       'note': newNote,
//       'type': type,
//       'imageUrl': imageUrl,
//       'timestamp': Timestamp.now(),
//     });
//   }

//   Future<void> deleteNote(String docID) {
//     return notes.doc(docID).delete();
//   }
// }

// class StorageService with ChangeNotifier {
//   final firebaseStorage = FirebaseStorage.instance;

//   Future<String?> uploadImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image == null) return null;

//     File file = File(image.path);
//     try {
//       String filePath = 'uploaded_images/${DateTime.now()}.png';
//       await firebaseStorage.ref(filePath).putFile(file);
//       return await firebaseStorage.ref(filePath).getDownloadURL();
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreService {
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String note, String type, String? imageUrl, String price) {
    return notes.add({
      'note': note,
      'type': type,
      'imageUrl': imageUrl,
      'price': price,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getNotesStream() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> updateNote(String docID, String newNote, String type, String? imageUrl, String price) {
    return notes.doc(docID).update({
      'note': newNote,
      'type': type,
      'imageUrl': imageUrl,
      'price': price,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}

class StorageService with ChangeNotifier {
  final firebaseStorage = FirebaseStorage.instance;

  Future<String?> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    File file = File(image.path);
    try {
      String filePath = 'uploaded_images/${DateTime.now()}.png';
      await firebaseStorage.ref(filePath).putFile(file);
      return await firebaseStorage.ref(filePath).getDownloadURL();
    } catch (e) {
      print(e);
      return null;
    }
  }
}





