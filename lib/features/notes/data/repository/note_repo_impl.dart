import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/features/notes/domain/model/notes_model.dart';
import 'package:kuraa/features/notes/domain/repository/note_repository.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: NoteRepository)

///Note Repository Impl class
class NoteRepoImpl implements NoteRepository {
  ////
  NoteRepoImpl({
    required this.firebaseFirestore,
    required this.firebaseStorage,
    required this.firebaseAuth,
  });

  /// Fireabse Firestore instance
  final FirebaseFirestore firebaseFirestore;

  /// FirebaseAuth instance
  final FirebaseAuth firebaseAuth;

  /// Firebase Storage instance
  final FirebaseStorage firebaseStorage;

  @override
  Future<void> createNote({required NoteModel note}) async {
    try {
      final uid = firebaseAuth.currentUser!.uid;

      if (note.imageUrl != null) {
        final storage = firebaseStorage.ref('/images/');

        const imageId = Uuid();
        final uploadTask =
            await storage.child(imageId.v4()).putFile(File(note.imageUrl!));
        final imageUrl = await uploadTask.ref.getDownloadURL();
        log(imageUrl, name: 'get download URl');
        await firebaseFirestore
            .collection('notes')
            .doc(uid)
            .collection('note')
            .add(
              note.copyWith(imageUrl: imageUrl).toDocument(),
            );
      } else {
        await firebaseFirestore
            .collection('notes')
            .doc(uid)
            .collection('note')
            .add(
              note.toDocument(),
            );
      }
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: '');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteNote({required String id}) async {
    final uid = firebaseAuth.currentUser!.uid;
    await firebaseFirestore
        .collection('notes')
        .doc(uid)
        .collection('note')
        .doc(id)
        .delete();

    try {} on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: '');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<List<NoteModel>> getNotes() {
    try {
      final uid = firebaseAuth.currentUser!.uid;
      final firestoreCollection =
          firebaseFirestore.collection('notes').doc(uid).collection('note');
      log(
        firestoreCollection
            .snapshots()
            .map(
              (event) => event.docs.map(NoteModel.fromJson).toList(),
            )
            .toString(),
      );
      return firestoreCollection.snapshots().map(
            (event) => event.docs.map(NoteModel.fromJson).toList(),
          );
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: '');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateNote({required NoteModel note}) async {
    try {
      // final uid = firebaseAuth.currentUser!.uid;

      // final firestoreCollection = firebaseFirestore.collection('notes');
      // return firestoreCollection.where('uid', isEqualTo: ).snapshots().map(
      //       (event) => event.docs.map(NoteModel.fromJson).toList(),
      //     );
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: '');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
