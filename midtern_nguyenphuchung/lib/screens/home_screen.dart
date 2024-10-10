// import 'package:flutter/material.dart';
// import 'package:midtern_nguyenphuchung/services/firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final FirestoreService firestoreService = FirestoreService();
//   final TextEditingController noteController = TextEditingController();
//   final TextEditingController typeController = TextEditingController();
//   String? imageUrl;
//   String? errorMessage;
//   String? editingDocId; // Store the doc ID when editing a product

//   @override
//   void dispose() {
//     noteController.dispose();
//     typeController.dispose();
//     super.dispose();
//   }

//   Future<void> uploadImage() async {
//     final url = await Provider.of<StorageService>(context, listen: false).uploadImage();
//     if (url != null) {
//       setState(() {
//         imageUrl = url;
//       });
//     }
//   }

//   void addOrUpdateProduct() {
//     setState(() {
//       errorMessage = null; // Reset error message
//     });

//     // Validate input fields
//     if (noteController.text.isEmpty) {
//       setState(() {
//         errorMessage = "Product name is required.";
//       });
//       return;
//     }
//     if (typeController.text.isEmpty) {
//       setState(() {
//         errorMessage = "Type of product is required.";
//       });
//       return;
//     }

//     if (editingDocId == null) {
//       // Adding a new product
//       firestoreService.addNote(
//         noteController.text,
//         typeController.text,
//         imageUrl,
        
//       );
//     } else {
//       // Updating an existing product
//       firestoreService.updateNote(
//         editingDocId!,
//         noteController.text,
//         typeController.text,
//         imageUrl,
//       );
//     }

//     // Clear fields
//     noteController.clear();
//     typeController.clear();
//     setState(() {
//       imageUrl = null;
//       editingDocId = null; // Reset after editing
//     });
//   }

//   void editProduct(DocumentSnapshot document) {
//     setState(() {
//       editingDocId = document.id;
//       noteController.text = document['note'] ?? '';
//       typeController.text = document['type'] ?? '';
//       imageUrl = document['imageUrl'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Product Management")),
//       body: Column(
//         children: [
//           // Input Fields
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: noteController,
//                   decoration: const InputDecoration(
//                     labelText: 'Product Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: typeController,
//                   decoration: const InputDecoration(
//                     labelText: 'Type of Product',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: uploadImage,
//                   child: const Text("Upload Image"),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: addOrUpdateProduct,
//                   child: Text(editingDocId == null ? "Add Product" : "Update Product"),
//                 ),
//                 if (errorMessage != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Text(
//                       errorMessage!,
//                       style: const TextStyle(color: Colors.red),
//                     ),
//                   ),
//               ],
//             ),
//           ),

//           // Product List
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: firestoreService.getNotesStream(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 List<DocumentSnapshot> notesList = snapshot.data!.docs;

//                 return ListView.builder(
//                   itemCount: notesList.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot document = notesList[index];
//                     Map<String, dynamic> data = document.data() as Map<String, dynamic>;

//                     return Card(
//                       margin: const EdgeInsets.all(10),
//                       child: ListTile(
//                         title: Text(data['note'] ?? 'No Title'),
//                         subtitle: Text('Type: ${data['type']}'),
//                         leading: data['imageUrl'] != null
//                             ? Image.network(
//                                 data['imageUrl'],
//                                 width: 50,
//                                 height: 50,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) =>
//                                     const Icon(Icons.broken_image),
//                               )
//                             : const Icon(Icons.image, size: 50),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () => editProduct(document),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => firestoreService.deleteNote(document.id),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:midtern_nguyenphuchung/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  String? imageUrl;
  String? errorMessage;
  String? editingDocId; // Store the doc ID when editing a product

  @override
  void dispose() {
    noteController.dispose();
    typeController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> uploadImage() async {
    final url = await Provider.of<StorageService>(context, listen: false).uploadImage();
    if (url != null) {
      setState(() {
        imageUrl = url;
      });
    }
  }

  void addOrUpdateProduct() {
    setState(() {
      errorMessage = null; // Reset error message
    });

    // Validate input fields
    if (noteController.text.isEmpty) {
      setState(() {
        errorMessage = "Product name is required.";
      });
      return;
    }
    if (typeController.text.isEmpty) {
      setState(() {
        errorMessage = "Type of product is required.";
      });
      return;
    }

    if (editingDocId == null) {
      // Adding a new product
      firestoreService.addNote(
        noteController.text,
        typeController.text,
        imageUrl,
        priceController.text,
      );
    } else {
      // Updating an existing product
      firestoreService.updateNote(
        editingDocId!,
        noteController.text,
        typeController.text,
        imageUrl,
        priceController.text,
      );
    }

    // Clear fields
    noteController.clear();
    typeController.clear();
    priceController.clear();
    setState(() {
      imageUrl = null;
      editingDocId = null; // Reset after editing
    });
  }

  void editProduct(DocumentSnapshot document) {
    setState(() {
      editingDocId = document.id;
      noteController.text = document['note'] ?? '';
      typeController.text = document['type'] ?? '';
      priceController.text = document['price'] ?? '';
      imageUrl = document['imageUrl'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Management")),
      body: Column(
        children: [
          // Input Fields
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: noteController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: typeController,
                  decoration: const InputDecoration(
                    labelText: 'Type of Product',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price of Product',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: uploadImage,
                  child: const Text("Upload Image"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addOrUpdateProduct,
                  child: Text(editingDocId == null ? "Add Product" : "Update Product"),
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),

          // Product List
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestoreService.getNotesStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<DocumentSnapshot> notesList = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = notesList[index];
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(data['note'] ?? 'No Title'),
                        subtitle: Text('Type: ${data['type']} | Price: ${data['price']}'),
                        leading: data['imageUrl'] != null
                            ? Image.network(
                                data['imageUrl'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image),
                              )
                            : const Icon(Icons.image, size: 50),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => editProduct(document),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => firestoreService.deleteNote(document.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

