import 'package:diary/src/app_injector.dart';
import 'package:diary/src/core/system_design/diary_outline_button.dart';
import 'package:diary/src/core/system_design/diary_text_button.dart';
import 'package:diary/src/core/system_design/diary_text_field.dart';
import 'package:diary/src/core/utils/api_status.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_bloc.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_event.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_state.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDiaryScreen extends StatelessWidget {
  const AddDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (_) => sl<AddDiaryBloc>(),
            child: _AddDiaryContent(),
          ),
        ),
      ),
    );
  }
}

class _AddDiaryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddDiaryBloc, AddDiaryState>(
      listener: (context, state) {
        if (state.status == ApiStatus.success) {
          Navigator.of(context).pop();
        }
      },
      child: Column(
        children: [
          _DiaryInput(),
          const Spacer(),
          _AdditionalButton(),
          const Spacer(),
          _ForwardButton(),
        ],
      ),
    );
  }
}

class _DiaryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final diaryBloc = context.read<AddDiaryBloc>();
    return Hero(
      tag: 'add_diary',
      child: Material(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: BlocProvider.value(
                value: diaryBloc,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          BlocBuilder<AddDiaryBloc, AddDiaryState>(
                            builder: (context, state) {
                              if (state.tag != null) {
                                return Row(
                                  children: [
                                    Chip(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                      label: Text('#${state.tag}'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          Expanded(child: _TitleInput()),
                        ],
                      ),
                      _ContentInput(),
                      const SizedBox(height: 16),
                      BlocBuilder<AddDiaryBloc, AddDiaryState>(
                        builder: (context, state) {
                          if (state.image != null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(state.image!),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryTextField(
      onChanged: (title) =>
          context.read<AddDiaryBloc>().add(DiaryTitleChanged(title)),
      hintText: 'title',
      isBorder: false,
      fontSize: 32,
    );
  }
}

class _ContentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryTextField(
      onChanged: (title) =>
          context.read<AddDiaryBloc>().add(DiaryContentChanged(title)),
      hintText: 'content',
      isBorder: false,
      singleLine: false,
      fontSize: 16,
    );
  }
}

class _AdditionalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> showTagPicker() async {
      final selectedTag = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: dummyTags.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dummyTags[index]),
                  onTap: () {

                    Navigator.of(context).pop(dummyTags[index]);
                  },
                );
              },
            ),
          );
        },
      );

      if (selectedTag != null) {
        if (context.mounted) {
          context.read<AddDiaryBloc>().add(DiaryTagChanged(selectedTag));
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                context.read<AddDiaryBloc>().add(const PickImageRequested());
              },
              icon: Icon(Icons.image,
                  color: Theme.of(context).colorScheme.surfaceContainer),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                showTagPicker();
              },
              icon: Icon(Icons.format_quote,
                  color: Theme.of(context).colorScheme.surfaceContainer),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check_circle,
                  color: Theme.of(context).colorScheme.surfaceContainer),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForwardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DiaryTextButton(
            data: 'cancel',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 16),
        BlocBuilder<AddDiaryBloc, AddDiaryState>(
          builder: (context, state) {
            return Expanded(
              child: DiaryOutlineButton(
                isLoading: state.status == ApiStatus.loading,
                data: 'save',
                onPressed: () {
                  context.read<AddDiaryBloc>().add(const DiarySubmitted());
                },
              ),
            );
          },
        )
      ],
    );
  }
}
