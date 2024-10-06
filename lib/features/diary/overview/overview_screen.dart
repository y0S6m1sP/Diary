import 'package:diary/features/diary/add_diary/add_diary_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarTitle(),
        automaticallyImplyLeading: false,
        actions: const [
          _AddDiaryButton(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Overview Screen'),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('your diary');
  }
}

class _AddDiaryButton extends StatelessWidget {
  const _AddDiaryButton({super.key});

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
