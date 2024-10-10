// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:midtern_nguyenphuchung/services/firestore.dart'; // Assuming this file handles Firebase Storage logic

// class ImageUpload extends StatefulWidget {
//   const ImageUpload({super.key});

//   @override
//   State<ImageUpload> createState() => _ImageUploadState();
// }

// class _ImageUploadState extends State<ImageUpload> {
//   @override
//   void initState() {
//     super.initState();
//     fetchImages();
//   }

//   Future<void> fetchImages() async {
//     await Provider.of<StorageService>(context, listen: false).fetchImages();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<StorageService>(
//       builder: (context, storageService, child) {
//         final List<String> imageUrls = storageService.imageUrls;

//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Image Upload'),
//           ),
//           body: imageUrls.isEmpty
//               ? const Center(child: Text('No images uploaded yet.'))
//               : GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   padding: const EdgeInsets.all(10),
//                   itemCount: imageUrls.length,
//                   itemBuilder: (context, index) {
//                     final String imageUrl = imageUrls[index];

//                     return Image.network(imageUrl);
//                   },
//                 ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () => storageService.uploadImage(),
//             child: const Icon(Icons.add),
//           ),
//         );
//       },
//     );
//   }
// }
