import 'package:diary/data/model/diary.dart';
import 'package:diary/features/diary/add_diary/add_diary_screen.dart';
import 'package:diary/features/diary/overview/widgets/diary_item.dart';
import 'package:flutter/material.dart';

final List<Diary> diaries = [
  Diary(
      id: '1',
      title: 'First Diary',
      content: 'This is the',
      createdAt: DateTime.now()),
  Diary(
      id: '3',
      title: 'First Diary',
      content: 'This is the',
      createdAt: DateTime.now()),
  Diary(
      id: '2',
      title: 'First Diary',
      content: 'This is the',
      image:
          'https://firebasestorage.googleapis.com/v0/b/diary-85940.appspot.com/o/user_images%2F9c80bd8f-2888-40ab-b115-67a98b07fdbb.jpg?alt=media&token=9b7be2f8-40a8-45bd-b5d4-5fc7b3f3c122',
      createdAt: DateTime.now()),
];

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarTitle(),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: const [
          _AddDiaryButton(),
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: diaries.length,
                itemBuilder: (context, index) {
                  final isFirst = index == 0 ||
                      (index > 0 &&
                          diaries[index].groupName !=
                              diaries[index - 1].groupName);
                  return DiaryItem(diary: diaries[index], isFirst: isFirst);
                })),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'your diary',
      style: TextStyle(fontSize: 48),
    );
  }
}

class _AddDiaryButton extends StatelessWidget {
  const _AddDiaryButton();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'add_diary',
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const AddDiaryScreen(),
            ),
          );
        },
        icon: AspectRatio(
          aspectRatio: 1,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
