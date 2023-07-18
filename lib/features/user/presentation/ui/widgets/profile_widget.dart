import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/features/user/presentation/cubit/profile/cubit/profile_cubit.dart';

/// Profile Widget Calss
class ProfileWidget extends StatelessWidget {
  ///
  const ProfileWidget({
    required this.onTap,
    super.key,
  });

  /// callback
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          height: 42,
          width: 42,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const CircularProgressIndicator();
              }
              if (state is ProfileLoaded) {
                return Image.network(state.currentUser.profileUrl!);
              }
              return const Icon(Icons.verified_user);
            },
          ),
        ),
      ),
    );
  }
}
