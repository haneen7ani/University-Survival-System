import 'package:flutter/material.dart';

import '../data/profile_store.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/pip.dart';
import '../widgets/profile_avatar.dart';
import 'companion_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onNavigate});

  /// Switches the bottom-navigation tab (0 Home, 1 Courses, 2 Planner, 3 GPA, 4 Guide).
  final ValueChanged<int> onNavigate;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _Task {
  _Task(this.title, this.course, this.duration, this.done);

  final String title;
  final String course;
  final String duration;
  bool done;
}

class _HomeScreenState extends State<HomeScreen> {
  final _tasks = <_Task>[
    _Task('Review lecture 6', 'Data Structures', '1 h', true),
    _Task('Read chapter 4', 'Probability & Statistics', '30 min', true),
    _Task('Discrete Math problem set', 'Discrete Mathematics', '45 min', false),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Saturday, 21 November',
                    style: TextStyle(fontSize: 13, color: AppColors.muted),
                  ),
                  const SizedBox(height: 2),
                  ListenableBuilder(
                    listenable: ProfileStore.instance,
                    builder: (context, _) {
                      final name = ProfileStore.instance.name.trim();
                      return Text(
                        name.isEmpty ? 'Good evening' : 'Good evening, $name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.heading(26),
                      );
                    },
                  ),
                ],
              ),
            ),
            HeaderIconButton(
              icon: Icons.notifications_none,
              tooltip: 'Notifications',
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Semantics(
              button: true,
              label: 'Open profile',
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (_) => const ProfileScreen()),
                ),
                child: const ProfileAvatar(size: 44),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _CompanionCard(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const CompanionScreen()),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: 'Cumulative GPA',
                value: '3.42',
                caption: 'out of 4.00',
                onTap: () => widget.onNavigate(3),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                label: 'Next deadline',
                value: '3 days',
                caption: 'Database Systems · Assignment 2',
                onTap: () => widget.onNavigate(2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Expanded(child: SectionTitle('Today')),
            TextButton(
              onPressed: () => widget.onNavigate(2),
              child: const Text(
                'See planner',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 56, 50, 112)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        for (final task in _tasks) ...[
          AppCard(
            padding: EdgeInsets.zero,
            child: CheckboxListTile(
              value: task.done,
              onChanged: (value) => setState(() => task.done = value ?? false),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: const Color.fromARGB(255, 51, 48, 112),
              title: Text(
                task.title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: task.done ? AppColors.muted : AppColors.ink,
                  decoration: task.done ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text(
                task.course,
                style: const TextStyle(fontSize: 12, color: AppColors.muted),
              ),
              secondary: Text(
                task.duration,
                style: const TextStyle(fontSize: 12, color: AppColors.muted),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 8),
        AppCard(
          radius: 20,
          onTap: () => widget.onNavigate(4),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.explore_outlined,
                    color: Color.fromARGB(255, 51, 48, 112)),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'University guide',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Registration, fees and common questions',
                      style: TextStyle(fontSize: 12, color: AppColors.muted),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.muted),
            ],
          ),
        ),
      ],
    );
  }
}

class _CompanionCard extends StatelessWidget {
  const _CompanionCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 51, 48, 112),
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Pip(size: 64),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pip · Level 3',
                        style: AppTheme.heading(17, color: Colors.white)),
                    const SizedBox(height: 6),
                    const Text(
                      '2 of 3 tasks done today',
                      style: TextStyle(
                          fontSize: 13, color: AppColors.onPrimarySoft),
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.6,
                        minHeight: 8,
                        backgroundColor: Color(0x47FFFFFF),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.amber),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '120 / 200 XP',
                      style: TextStyle(
                          fontSize: 12, color: AppColors.onPrimarySoft),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.caption,
    required this.onTap,
  });

  final String label;
  final String value;
  final String caption;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 20,
      onTap: onTap,
      child: SizedBox(
        height: 80,
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
            const SizedBox(height: 6),
            Text(value, style: AppTheme.heading(32)),
            const SizedBox(height: 6),
            Text(
              caption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }
}
