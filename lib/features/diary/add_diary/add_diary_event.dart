sealed class AddDiaryEvent {
  const AddDiaryEvent();
}

class PickImageRequested extends AddDiaryEvent {
  const PickImageRequested();
}

class DiaryTitleChanged extends AddDiaryEvent {
  const DiaryTitleChanged(this.title);

  final String title;
}

class DiaryContentChanged extends AddDiaryEvent {
  const DiaryContentChanged(this.content);

  final String content;
}

class DiarySubmitted extends AddDiaryEvent {
  const DiarySubmitted();
}
