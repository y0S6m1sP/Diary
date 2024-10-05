import 'package:diary/core/system_design/diary_outline_button.dart';
import 'package:diary/core/system_design/diary_text_button.dart';
import 'package:diary/core/system_design/diary_text_field.dart';
import 'package:flutter/material.dart';

class AddDiaryScreen extends StatelessWidget {
  const AddDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DiaryInput(),
                const Spacer(),
                _AdditionalButton(),
                const Spacer(),
                _ForwardButton(),
              ]),
        ),
      ),
    );
  }
}

class _DiaryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DiaryTextField(
                    hintText: 'title',
                    isBorder: false,
                    fontSize: 32,
                  ),
                  DiaryTextField(
                    hintText: 'content',
                    isBorder: false,
                    singleLine: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AdditionalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              icon: Icon(Icons.image,
                  color: Theme.of(context).colorScheme.surfaceContainer),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
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
        const Expanded(
          child: DiaryOutlineButton(data: 'save'),
        ),
      ],
    );
  }
}
