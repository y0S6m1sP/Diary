import 'package:diary/src/features/diary/diary_injector.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initApp() {
  initDiary();
}
