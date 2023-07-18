import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
import 'package:kuraa/core/helper/gap.dart';
import 'package:kuraa/core/theme/app_colors.dart';
import 'package:kuraa/features/notes/cubit/note_cubit.dart';
import 'package:kuraa/features/user/data/model/user_model.dart';
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
          ProfileWidget(
            onTap: () {
              context.pushNamed(AppRoutes.profile, extra: widget.uid);
            },
          ),
          HorizontalGap.s,
        ],
      ),
      body: Center(
        child: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NoteLoadedState) {
              if (state.notes.isEmpty) {
                return const Text('No Notes Added');
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return const Text('hello');
                },
              );
            }
            if (state is NoteLoadingState) {
              return const CircularProgressIndicator(
                color: LightColor.grey,
              );
            }
            return const Text('No Data');
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
}
