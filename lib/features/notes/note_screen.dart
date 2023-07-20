import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuraa/core/helper/extension/context_extension.dart';
import 'package:kuraa/core/helper/gap.dart';
import 'package:kuraa/core/theme/app_colors.dart';
import 'package:kuraa/core/widgets/custom_button.dart';
import 'package:kuraa/features/notes/cubit/note_cubit.dart';
import 'package:kuraa/features/notes/domain/model/notes_model.dart';
import 'package:uuid/uuid.dart';

/// Note Screen
class NoteScreen extends StatefulWidget {
  ///
  const NoteScreen({this.note, this.createMode = false, super.key});

  /// edit mode
  final bool? createMode;

  /// NoteModel
  final NoteModel? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  String? imagePath;
  bool? editMode;

  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController bodyEditingController = TextEditingController();
  final uuid = const Uuid();
  @override
  void initState() {
    super.initState();
    widget.note != null
        ? titleEditingController.text = widget.note!.title!
        : titleEditingController.text = '';
    widget.note != null
        ? bodyEditingController.text = widget.note!.body!
        : bodyEditingController.text = '';
    editMode = widget.createMode;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // if (widget.createMode) editMode = false;

    return Scaffold(
      appBar: appBar(context),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: SingleChildScrollView(
          child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'note title',
                    style: context.textTheme.bodyMedium,
                  ),
                  VerticalGap.xs,
                  formWidget(context),
                  VerticalGap.l,
                  if (widget.createMode!) saveButton(state, context)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Button
  CustomElevatedButton saveButton(NoteState state, BuildContext context) {
    return CustomElevatedButton(
      isLoading: state is NoteLoadingState,
      buttonText: 'Save',
      onButtonPressed: () async {
        if (formKey.currentState!.validate()) {
          await context.read<NoteCubit>().addNote(
                note: NoteModel(
                  title: titleEditingController.text,
                  body: bodyEditingController.text,
                  id: uuid.v4(),
                  imageUrl: imagePath,
                ),
              );
          if (context.mounted) {
            context
              ..showSnackBar(
                message: 'Note Added Successfully',
                toastType: ToastType.success,
              )
              ..pop();
          }
        }
      },
    );
  }

  /// Form
  Form formWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: titleEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'No Empty Title Allowed';
              }
              return null;
            },
            keyboardType: TextInputType.multiline,
            readOnly: !editMode!,
          ),
          VerticalGap.l,
          if (imagePath != null)
            SizedBox(
              child: Image.file(File(imagePath!)),
            )
          else
            const SizedBox.shrink(),
          VerticalGap.l,
          if (widget.note?.imageUrl == null)
            CustomElevatedButton(
              onButtonPressed: () async {
                await bottomSheet(context);
              },
              buttonText: 'Upload Image',
            )
          else
            SizedBox(
              child: Image.network(
                widget.note!.imageUrl!,
              ),
            ),
          VerticalGap.l,
          const Text('note body'),
          VerticalGap.xs,
          TextFormField(
            controller: bodyEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'No Empty body Allowed';
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: editMode! ? 16 : 20,
            readOnly: !editMode!,
          ),
        ],
      ),
    );
  }

  /// AppBar widget
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: LightColor.whiteSmokeLight,
      title: Text(
        widget.note?.title != null ? widget.note!.title! : 'note',
        style: context.textTheme.headlineMedium,
      ),
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
      actions: [
        if (!widget.createMode!) ...[
          editButton(),
          HorizontalGap.l,
          const Icon(
            Icons.delete,
            size: 28,
            color: LightColor.eclipse,
          ),
        ],
        HorizontalGap.l,
      ],
    );
  }

  GestureDetector editButton() {
    return GestureDetector(
      onTap: () {
        log('edip button pressed');
        setState(() {
          editMode = !editMode!;
        });
      },
      child: Container(
        height: 32,
        width: 36,
        decoration: BoxDecoration(
          color: editMode! ? LightColor.grey : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: const Icon(
          Icons.edit_note_rounded,
          size: 30,
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
