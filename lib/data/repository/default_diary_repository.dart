import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/data/model/diary.dart';
import 'package:diary/domain/repository/diary_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final _db = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
final _storage = FirebaseStorage.instance;

class DefaultDiaryRepository extends DiaryRepository {
  @override
  Future<void> addDiary({
    required String title,
    required String content,
    String? tag,
    File? image,
  }) async {
    final user = _auth.currentUser;
    String? imageUrl;

    if (image != null) {
      final storageRef =
          _storage.ref().child('user_images').child('${_uuid.v4()}.jpg');
      await storageRef.putFile(image);
      imageUrl = await storageRef.getDownloadURL();
    }

    _db.collection('${user?.uid}').add(
      {
        'title': title,
        'content': content,
        'image': imageUrl,
        'tag': tag,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
  }

  @override
  Stream<List<Diary>> watchDiaries() {
    final user = _auth.currentUser;
    return _db
        .collection('${user?.uid}')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (doc) {
              final data = doc.data();
              return Diary(
                id: doc.id,
                title: data['title'],
                content: data['content'],
                image: data['image'],
                tag: data['tag'],
                createdAt: (data['createdAt'] as Timestamp).toDate(),
              );
            },
          ).toList(),
        );
  }
}
