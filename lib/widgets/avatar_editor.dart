import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/profile_store.dart';
import '../theme/app_theme.dart';
import 'profile_avatar.dart';

/// Avatar with a camera badge. Tapping the badge lets the student pick a
/// photo from the gallery, take one, or go back to the gender icon.
class AvatarEditor extends StatelessWidget {
  const AvatarEditor({super.key, this.size = 112});

  final double size;

  Future<void> _pick(BuildContext context, ImageSource source) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 85,
      );
      if (file == null) return;
      ProfileStore.instance.setPhoto(await file.readAsBytes());
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Could not open the photo picker on this device.')),
      );
    }
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(sheetContext);
                _pick(context, ImageSource.gallery);
              },
            ),
            if (!kIsWeb)
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _pick(context, ImageSource.camera);
                },
              ),
            if (ProfileStore.instance.photo != null)
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('Remove photo'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  ProfileStore.instance.setPhoto(null);
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          ProfileAvatar(size: size),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: AppColors.primary,
              shape: const CircleBorder(side: BorderSide(color: Colors.white, width: 2)),
              child: IconButton(
                onPressed: () => _showOptions(context),
                tooltip: 'Change profile photo',
                constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                icon: const Icon(Icons.photo_camera_outlined, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
