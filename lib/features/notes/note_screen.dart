import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuraa/core/helper/extension/context_extension.dart';
import 'package:kuraa/core/helper/gap.dart';
import 'package:kuraa/core/theme/app_colors.dart';
import 'package:kuraa/core/widgets/custom_button.dart';

/// Note Screen
class NoteScreen extends StatefulWidget {
  ///
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  String? imagePath;
  bool editMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('noteTitle'),
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                editMode = !editMode;
              });
            },
            child: const Icon(
              Icons.edit_note_outlined,
              size: 30,
            ),
          ),
          HorizontalGap.l,
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'note title',
                style: context.textTheme.bodyMedium,
              ),
              VerticalGap.xs,
              TextField(
                keyboardType: TextInputType.multiline,
                readOnly: !editMode,
              ),
              VerticalGap.l,
              if (imagePath != null)
                SizedBox(
                  child: Image.file(File(imagePath!)),
                )
              else
                const SizedBox.shrink(),
              VerticalGap.l,
              CustomElevatedButton(
                onButtonPressed: () async {
                  await bottomSheet(context);
                },
                buttonText: 'Upload Image',
              ),
              VerticalGap.l,
              const Text('note body'),
              VerticalGap.xs,
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: editMode ? 18 : 20,
                readOnly: !editMode,
              ),
              VerticalGap.l,
              if (editMode)
                CustomElevatedButton(
                  buttonText: 'Save',
                  onButtonPressed: () {},
                )
            ],
          ),
        ),
      ),
    );
  }

  /// BottomSheet
  Future<void> bottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: context.primary,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Divider(
                indent: context.width * .3,
                endIndent: context.width * .3,
                color: LightColor.grey,
              ),
              CustomElevatedButton(
                onButtonPressed: () async {
                  final picker = ImagePicker();
                  final image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {
                    imagePath = image!.path;
                  });
                  if (context.mounted) {
                    context.pop();
                  }
                },
                buttonText: 'from gallery',
              ),
              CustomElevatedButton(
                onButtonPressed: () async {
                  final picker = ImagePicker();
                  final image = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  setState(() {
                    imagePath = image!.path;
                  });
                  if (context.mounted) {
                    context.pop();
                  }
                },
                buttonText: 'from camera',
              )
            ],
          ),
        );
      },
    );
  }
}
