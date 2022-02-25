// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static final CollectionReference _user = _firestore.collection('user');
//
//   final Stream<QuerySnapshot> _userStream = _user.snapshots();
//
//   Future<void> addUser() async {
//     await _user.add({
//       'name': 'MINODA KOHEI',
//       'age': '24'
//     });
//     print('追加完了');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: StreamBuilder(
//         stream: _userStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if(snapshot.hasError) {
//             return const Text("エラーが発生しました");
//           } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
//             return const Text("ドキュメントがありません");
//           } else if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else {
//             List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
//             return ListView(
//               children: docs.map((doc) {
//                 Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//                 String name = data['name'];
//                 return Text(name);
//               }).toList(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addUser,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }