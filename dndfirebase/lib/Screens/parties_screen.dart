// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Parties")),
      body: _ChatList(),
    );
  }
}

class _ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return StreamBuilder(
      stream: db
          .collection("/Parties")
          .orderBy("createdAt", descending: true)
          .snapshots(),
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      ) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final querySnap = snapshot.data!;
        final docs = querySnap.docs;
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            return ListTile(
              title: Text(doc['title']),
              subtitle: Text(doc.id),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/chat-messages',
                  arguments: doc.id,
                );
              },
            );
          },
        );
      },
    );
  }
}
