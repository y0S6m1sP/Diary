import 'package:diary/core/utils/color_generator.dart';
import 'package:diary/data/model/diary.dart';
import 'package:flutter/material.dart';

class DiaryItem extends StatelessWidget {
  const DiaryItem({super.key, required this.diary, this.isFirst = false});

  final Diary diary;
  final isFirst;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final randomColor = DiaryColorGenerator.getRandomColor(isDarkMode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isFirst
            ? Text(
                diary.groupName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            : const SizedBox.shrink(),
        isFirst ? const SizedBox(height: 24) : const SizedBox.shrink(),
        Text(
          diary.formattedTime,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: randomColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            diary.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            diary.content,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          if (diary.image != null &&
                              diary.image!.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                diary.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
