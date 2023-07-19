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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: note.title!.length < 10
              ? Colors.blue
              : note.title!.length < 14
                  ? Colors.yellow
                  : note.title!.length < 20
                      ? Colors.red
                      : Colors.deepOrange,
          // gradient: const LinearGradient(
          //   colors: [
          //     Color(0xffb9b9b9),
          //     Color(0xff464646),
          //   ],
          //   stops: [0, 1],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        // height: context.height * .6,
        // width: context.width * .45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.headlineSmall!.copyWith(
                color: Colors.black,
              ),
            ),
            VerticalGap.s,
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
            Text(
              note.body! +
                  'lksdjflksjdlfjlsadjfkljasldkfjlsd lfkjasldflsak dflak sdl aslkdfjalskdj flkasd flkajsdlkfjasdlkfjald flakjd flak',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
