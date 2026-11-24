import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/pip.dart';

class CompanionScreen extends StatelessWidget {
  const CompanionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your companion')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            Center(
              child: Container(
                width: 190,
                height: 190,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.primarySoft,
                  shape: BoxShape.circle,
                ),
                child: const Pip(size: 150),
              ),
            ),
            const SizedBox(height: 16),
            Center(child: Text('Pip · Level 3', style: AppTheme.heading(26))),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: const LinearProgressIndicator(
                value: 0.6,
                minHeight: 10,
                backgroundColor: AppColors.border,
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 51, 48, 112)),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '120 / 200 XP to Level 4',
                style: TextStyle(fontSize: 13, color: AppColors.muted),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Pill(
                '5-day streak',
                background: AppColors.amberSoft,
                foreground: AppColors.amberInk,
              ),
            ),
            const SizedBox(height: 24),
            const SectionTitle("Today's quests"),
            const SizedBox(height: 12),
            const _QuestCard(title: 'Finish 3 tasks', progress: 2 / 3, count: '2 / 3', reward: '+30 XP'),
            const SizedBox(height: 8),
            const _QuestCard(title: 'Log one study session', progress: 0, count: '0 / 1', reward: '+20 XP'),
            const SizedBox(height: 24),
            const SectionTitle('Badges'),
            const SizedBox(height: 12),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _Badge(
                    label: 'First task',
                    icon: Icons.check,
                    background: Color.fromARGB(255, 51, 48, 112),
                    foreground: Colors.white,
                  ),
                ),
                Expanded(
                  child: _Badge(
                    label: '5-day streak',
                    icon: Icons.local_fire_department_outlined,
                    background: AppColors.amber,
                    foreground: AppColors.ink,
                  ),
                ),
                Expanded(
                  child: _Badge(
                    label: 'Planner pro',
                    icon: Icons.event_available_outlined,
                    background: Color.fromARGB(255, 51, 48, 112),
                    foreground: Colors.white,
                  ),
                ),
                Expanded(
                  child: _Badge(
                    label: 'GPA tracker (locked)',
                    icon: Icons.lock_outline,
                    background: AppColors.border,
                    foreground: AppColors.muted,
                    muted: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuestCard extends StatelessWidget {
  const _QuestCard({
    required this.title,
    required this.progress,
    required this.count,
    required this.reward,
  });

  final String title;
  final double progress;
  final String count;
  final String reward;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: AppColors.border,
                    valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 51, 48, 112)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(count, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              Text(
                reward,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 51, 48, 112),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
    this.muted = false,
  });

  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: Icon(icon, color: foreground, size: 26),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: muted ? AppColors.muted : AppColors.ink,
          ),
        ),
      ],
    );
  }
}
