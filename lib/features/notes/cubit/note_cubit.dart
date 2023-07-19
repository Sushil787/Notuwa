import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/features/notes/domain/model/notes_model.dart';
import 'package:kuraa/features/notes/domain/repository/note_repository.dart';

part 'note_state.dart';

@injectable

///Note Cubit
class NoteCubit extends Cubit<NoteState> {
  /// Constructor
  NoteCubit({required this.noteRepository}) : super(NoteInitial());

  /// Note Repository
  final NoteRepository noteRepository;

  /// AddNote Method
  Future<void> addNote({required NoteModel note}) async {
    try {
      emit(NoteLoadingState());
      await noteRepository.createNote(note: note);
      // emit(NoteSuccessState());
    } on FirebaseException catch (e) {
      emit(NoteLoadFailState(e.code));
    } catch (e) {
      emit(NoteLoadFailState(e.toString()));
    }
  }

  /// UpdateNote Method
  Future<void> updateNote() async {
    try {} on FirebaseException catch (e) {
      emit(NoteLoadFailState(e.code));
    } catch (e) {
      emit(NoteLoadFailState(e.toString()));
    }
  }

  /// GetNote Method
  Future<void> getNotes() async {
    try {
      emit(NoteLoadingState());
      noteRepository.getNotes().listen((notes) {
        log(name: 'mero note', notes.length.toString());
        emit(NoteLoadedState(notes));
      });
    } on FirebaseException catch (e) {
      emit(NoteLoadFailState(e.code));
    } catch (e) {
      emit(NoteLoadFailState(e.toString()));
    }
  }

  /// Delete Note Method
  Future<void> deleteNotes() async {
    try {} on FirebaseException catch (e) {
      emit(NoteLoadFailState(e.code));
    } catch (e) {
      emit(NoteLoadFailState(e.toString()));
    }
  }
}
