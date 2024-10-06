import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/domain/repository/diary_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _db = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class DefaultDiaryRepository extends DiaryRepository {
  @override
  Future<void> addDiary({
    required String title,
    required String content,
    File? image,
  }) async {
    final user = _auth.currentUser;

    _db.collection('${user?.uid}').add({
      'title': title,
      'content': content,
      'image': image,
      'timestamp': FieldValue.serverTimestamp(),
    },);
  }
}
