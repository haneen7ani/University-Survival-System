import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/avatar_editor.dart';
import '../widgets/common.dart';
import '../widgets/profile_fields.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: const [
            Center(child: AvatarEditor(size: 120)),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Tap the camera to add a photo',
                style: TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 51, 48, 112)),
              ),
            ),
            SizedBox(height: 24),
            SectionTitle('Name'),
            SizedBox(height: 12),
            NameField(),
            SizedBox(height: 24),
            SectionTitle('Gender'),
            SizedBox(height: 12),
            GenderPicker(),
            SizedBox(height: 12),
            Text(
              'Without a photo, your avatar shows an icon that matches your gender.',
              style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: Color.fromARGB(255, 51, 48, 112)),
            ),
          ],
        ),
      ),
    );
  }
}
