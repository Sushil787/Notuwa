
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/features/notes/domain/model/notes_model.dart';
import 'package:kuraa/features/notes/domain/repository/note_repository.dart';

part 'note_state.dart';

@singleton

///Note Cubit
class NoteCubit extends Cubit<NoteState> {
  /// Constructor
  NoteCubit({required this.noteRepository}) : super(NoteInitial());

  /// Note Repository
  final NoteRepository noteRepository;

  /// AddNote Method
  Future<void> addNote() async {
    emit(state);
  }

  /// UpdateNote Method
  Future<void> updateNote() async {
    emit(state);
  }

  /// GetNote Method
  Future<void> getNotes() async {
    emit(state);
  }

  /// Delete Note Method
  Future<void> deleteNotes() async {
    emit(state);
  }
}
