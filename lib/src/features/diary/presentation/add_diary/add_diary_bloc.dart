import 'dart:io';

import 'package:diary/src/core/utils/api_status.dart';
import 'package:diary/src/features/diary/domain/repository/diary_repository.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_event.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddDiaryBloc extends Bloc<AddDiaryEvent, AddDiaryState> {
  AddDiaryBloc({required DiaryRepository diaryRepository})
      : _diaryRepository = diaryRepository,
        super(const AddDiaryState()) {
    on<PickImageRequested>(_onPickImageRequested);
    on<DiaryTitleChanged>(_onDiaryTitleChanged);
    on<DiaryContentChanged>(_onDiaryContentChanged);
    on<DiaryTagChanged>(_onDiaryTagChanged);
    on<DiarySubmitted>(_onDiarySubmitted);
  }

  final DiaryRepository _diaryRepository;

  void _onDiaryTitleChanged(
    DiaryTitleChanged event,
    Emitter<AddDiaryState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onDiaryContentChanged(
    DiaryContentChanged event,
    Emitter<AddDiaryState> emit,
  ) {
    emit(state.copyWith(content: event.content));
  }

  void _onDiaryTagChanged(
    DiaryTagChanged event,
    Emitter<AddDiaryState> emit,
  ) {
    emit(state.copyWith(tag: event.tag));
  }

  Future<void> _onPickImageRequested(
    PickImageRequested event,
    Emitter<AddDiaryState> emit,
  ) async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: double.infinity,
    );

    if (pickedImage == null) {
      return;
    }

    return emit(state.copyWith(image: File(pickedImage.path)));
  }

  Future<void> _onDiarySubmitted(
    DiarySubmitted event,
    Emitter<AddDiaryState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 3));
      await _diaryRepository.addDiary(
        title: state.title,
        content: state.content,
        tag: state.tag,
        image: state.image,
      );
      emit(state.copyWith(status: ApiStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.error));
    }
  }
}
