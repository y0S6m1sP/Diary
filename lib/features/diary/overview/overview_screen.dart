import 'package:diary/data/model/diary.dart';
import 'package:diary/domain/repository/diary_repository.dart';
import 'package:diary/features/diary/add_diary/add_diary_screen.dart';
import 'package:diary/features/diary/overview/overview_cubit.dart';
import 'package:diary/features/diary/overview/overview_state.dart';
import 'package:diary/features/diary/overview/widgets/diary_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocProvider(
            create: (_) => OverviewCubit(
              context.read<DiaryRepository>(),
            ),
            child: const _OverviewContent(),
          ),
        ),
      ),
    );
  }
}

class _OverviewContent extends StatelessWidget {
  const _OverviewContent();

  @override
  Widget build(BuildContext context) {
    return const _DiaryList();
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

class _DiaryList extends StatefulWidget {
  const _DiaryList();

  @override
  State<_DiaryList> createState() => _DiaryListState();
}

class _DiaryListState extends State<_DiaryList> {

  @override
  void initState() {
    super.initState();
    context.read<OverviewCubit>().watchDiaries();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverviewCubit, OverviewState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.diaries.length,
          itemBuilder: (context, index) {
            final diary = state.diaries[index];
            final isFirst = index == 0 ||
                diary.groupName != state.diaries[index - 1].groupName;
            return DiaryItem(diary: diary, isFirst: isFirst);
          },
        );
      },
    );
  }
}
