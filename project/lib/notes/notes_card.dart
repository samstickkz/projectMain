import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget notesCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(doc['creation_date']),
          Text(doc['notes_title']),
          Text(doc['note_content']),
        ],
      ),
    ),
  );
}
