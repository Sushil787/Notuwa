import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maan ka Kura',
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
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(height: 100, width: 200),
          child: Container(
            color: Colors.red,
          ),
        ),
        // child: BlocBuilder<NoteCubit, NoteState>(
        //   builder: (context, state) {
        //     return GridView.builder(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //       ),
        //       itemBuilder: (context, index) {
        //         return null;

        //       },
        //     );
        //   },
        // ),
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
