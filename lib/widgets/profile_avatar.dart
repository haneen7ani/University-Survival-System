import 'package:flutter/material.dart';

import '../data/profile_store.dart';
import '../theme/app_theme.dart';

/// Round avatar: the student's photo if they added one, otherwise an icon
/// that follows their gender (neutral person icon until they choose).
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.size = 44});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ProfileStore.instance,
      builder: (context, _) {
        final store = ProfileStore.instance;
        final photo = store.photo;

        final IconData icon;
        final Color background;
        final Color foreground;
        switch (store.gender) {
          case Gender.male:
            icon = Icons.man;
            background = const Color(0xFFE0E7FF);
            foreground = const Color(0xFF3730A3);
          case Gender.female:
            icon = Icons.woman;
            background = const Color(0xFFFCE7F3);
            foreground = const Color(0xFF9D174D);
          case null:
            icon = Icons.person;
            background = AppColors.primarySoft;
            foreground = AppColors.primaryDark;
        }

        return Semantics(
          label: 'Profile picture',
          image: true,
          child: ClipOval(
            child: SizedBox(
              width: size,
              height: size,
              child: photo != null
                  ? Image.memory(photo, fit: BoxFit.cover)
                  : ColoredBox(
                      color: background,
                      child: Icon(icon, size: size * 0.64, color: foreground),
                    ),
            ),
          ),
        );
      },
    );
  }
}
