import 'package:flutter/material.dart';
import 'package:kuraa/core/helper/extension/context_extension.dart';
import 'package:kuraa/core/helper/gap.dart';
import 'package:kuraa/features/notes/domain/model/notes_model.dart';

/// Note Widget
class NoteWidget extends StatelessWidget {
  /// Constructor
  const NoteWidget({
    required this.note,
    required this.callback,
    super.key,
  });

  /// Note Model instance
  final NoteModel note;

  /// Call Back Function
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: note.title!.length < 8
              ? Colors.blue.shade400
              : note.title!.length < 12
                  ? Colors.yellow.shade400
                  : note.title!.length < 19
                      ? Colors.red.shade400
                      : Colors.deepOrange.shade400,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
            ),
            VerticalGap.xxs,
            if (note.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  child: Image.network(note.imageUrl!),
                ),
              )
            else
              const SizedBox.shrink(),
            VerticalGap.s,
            Flexible(
              child: Text(
                note.body!,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
