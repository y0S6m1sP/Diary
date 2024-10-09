import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/src/features/diary/data/models/diary_model.dart';
import 'package:diary/src/features/diary/domain/usecases/add_diary_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final _db = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
final _storage = FirebaseStorage.instance;

abstract class DiaryDataSource {
  Future<void> addDiary(AddDiaryParams params);

  Stream<List<DiaryModel>> watchDiaries();
}

class DefaultDiaryDataSource extends DiaryDataSource {
  @override
  Future<void> addDiary(AddDiaryParams params) async {
    final user = _auth.currentUser;
    String? imageUrl;

    if (params.image != null) {
      final storageRef =
          _storage.ref().child('user_images').child('${_uuid.v4()}.jpg');
      await storageRef.putFile(params.image!);
      imageUrl = await storageRef.getDownloadURL();
    }

    _db.collection('${user?.uid}').add(params.toMap(imageUrl));
  }

  @override
  Stream<List<DiaryModel>> watchDiaries() {
    final user = _auth.currentUser;
    return _db
        .collection('${user?.uid}')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (doc) {
              final data = doc.data();
              return DiaryModel.fromMap(data, doc.id);
            },
          ).toList(),
        );
  }
}
