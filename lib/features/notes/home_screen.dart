import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/core/helper/extension/context_extension.dart';
import 'package:kuraa/core/helper/gap.dart';
import 'package:kuraa/core/theme/app_colors.dart';
import 'package:kuraa/features/notes/cubit/note_cubit.dart';
import 'package:kuraa/features/user/presentation/cubit/profile/cubit/profile_cubit.dart';
import 'package:kuraa/features/user/presentation/ui/widgets/profile_widget.dart';

/// Home Screen

class HomeScreen extends StatefulWidget {
  ///
  const HomeScreen({required this.uid, super.key});

  /// UID
  final String uid;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfileProfile(uid: widget.uid);
    context.read<NoteCubit>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mero Note',
        ),
        actions: [
          profileBlock(),
          HorizontalGap.s,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {
            if (state is NoInternetState) {
              context.showSnackBar(
                message: 'No internet',
                toastType: ToastType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is NoteLoadedState) {
              if (state.notes.isEmpty) {
                return const Center(child: Text('No Notes Added'));
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  return note.imageUrl != null
                      ? SizedBox(
                          height: context.height * .3,
                          child: Column(
                            children: [
                              Image.network(note.imageUrl!),
                            ],
                          ),
                        )
                      : Container();
                },
              );
            }
            if (state is NoInternetState) {
              return const Center(
                child: Text('No Internet'),
              );
            }
            if (state is NoteLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: LightColor.grey,
                ),
              );
            }
            log(state.toString(), name: 'state');
            return const Center(child: Text('No Data'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightColor.eclipse,
        child: const Icon(Icons.add),
        onPressed: () {
          context.push(AppRoutes.note);
        },
      ),
    );
  }

  BlocBuilder<NoteCubit, NoteState> profileBlock() {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is NoInternetState) {
          return const Icon(Icons.person);
        }
        return ProfileWidget(
          onTap: () {
            context.pushNamed(
              AppRoutes.profile,
              extra: widget.uid,
            );
          },
        );
      },
    );
  }
}
