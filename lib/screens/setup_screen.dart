import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../theme/app_theme.dart';
import '../widgets/avatar_editor.dart';
import '../widgets/common.dart';
import '../widgets/profile_fields.dart';
import 'app_shell.dart';

/// First-run screen: pick university, faculty, program and level.
class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  String _university = universities.first;
  String _faculty = faculties.first;
  String _program = programs.first;
  String _level = levels[2];

  Future<void> _pick({
    required String title,
    required List<String> options,
    required String current,
    required ValueChanged<String> onSelected,
  }) async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
              child: Text(title, style: AppTheme.heading(18)),
            ),
            for (final option in options)
              ListTile(
                title: Text(option),
                trailing: option == current
                    ? const Icon(Icons.check, color: Color.fromARGB(255, 51, 48, 112))
                    : null,
                onTap: () => Navigator.pop(context, option),
              ),
          ],
        ),
      ),
    );
    if (choice != null) setState(() => onSelected(choice));
  }

  void _continue() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const AppShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalCredits = sampleCourses.fold<int>(0, (sum, c) => sum + c.credits);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 51, 48, 112),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.school, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text('University Survival System', style: AppTheme.heading(15)),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text('Set up your semester', style: AppTheme.heading(30)),
            const SizedBox(height: 8),
            const Text(
              'Tell us where you study and we will build your course list, '
              'GPA tracker and planner around it.',
              style: TextStyle(fontSize: 15, height: 1.5, color: AppColors.muted),
            ),
            const SizedBox(height: 24),
            const Center(child: AvatarEditor(size: 96)),
            const SizedBox(height: 16),
            const NameField(),
            const SizedBox(height: 12),
            const GenderPicker(),
            const SizedBox(height: 24),
            _SelectRow(
              label: 'University',
              value: _university,
              onTap: () => _pick(
                title: 'University',
                options: universities,
                current: _university,
                onSelected: (v) => _university = v,
              ),
            ),
            const SizedBox(height: 12),
            _SelectRow(
              label: 'Faculty',
              value: _faculty,
              onTap: () => _pick(
                title: 'Faculty',
                options: faculties,
                current: _faculty,
                onSelected: (v) => _faculty = v,
              ),
            ),
            const SizedBox(height: 12),
            _SelectRow(
              label: 'Program',
              value: _program,
              onTap: () => _pick(
                title: 'Program',
                options: programs,
                current: _program,
                onSelected: (v) => _program = v,
              ),
            ),
            const SizedBox(height: 12),
            _SelectRow(
              label: 'Academic level',
              value: _level,
              onTap: () => _pick(
                title: 'Academic level',
                options: levels,
                current: _level,
                onSelected: (v) => _level = v,
              ),
            ),
            const SizedBox(height: 24),
            AppCard(
              color: AppColors.primarySoft,
              borderColor: AppColors.primarySoft,
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 51, 48, 112),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${sampleCourses.length} courses · $totalCredits credit hours',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 51, 48, 112),
                          ),
                        ),
                        const Text(
                          'found for your level and program',
                          style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 51, 48, 112)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            FilledButton(onPressed: _continue, child: const Text('Continue')),
            const SizedBox(height: 12),
            const Text(
              'You can change this anytime in your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectRow extends StatelessWidget {
  const _SelectRow({required this.label, required this.value, required this.onTap});

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: AppColors.muted),
        ],
      ),
    );
  }
}
