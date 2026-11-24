import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class _Day {
  const _Day(this.name, this.number, this.dot);

  final String name;
  final int number;
  final Color? dot;
}

const _week = <_Day>[
  _Day('Sat', 21, AppColors.amber),
  _Day('Sun', 22, null),
  _Day('Mon', 23, Color.fromARGB(255, 55, 53, 112)),
  _Day('Tue', 24, AppColors.orange),
  _Day('Wed', 25, null),
  _Day('Thu', 26, AppColors.orange),
  _Day('Fri', 27, null),
];

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      children: [
        ScreenHeader(
          title: 'Study planner',
          subtitle: 'November 2026',
          trailing: HeaderIconButton(
            icon: Icons.notifications_active_outlined,
            tooltip: 'Reminders are on',
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            for (var i = 0; i < _week.length; i++)
              Expanded(
                child: _DayButton(
                  day: _week[i],
                  selected: i == _selected,
                  onTap: () => setState(() => _selected = i),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        const SectionTitle('Today'),
        const SizedBox(height: 12),
        const _SessionCard(
          time: '4:00 PM',
          length: '1 h',
          title: 'Review lecture 6',
          detail: 'Data Structures · Study session',
          tag: 'Study',
          tagBackground: AppColors.primarySoft,
          tagForeground: Color.fromARGB(255, 51, 46, 112),
        ),
        const SizedBox(height: 8),
        const _SessionCard(
          time: '6:00 PM',
          length: '45 min',
          title: 'Problem set',
          detail: 'Discrete Mathematics · Task',
          tag: 'Task',
          tagBackground: AppColors.border,
          tagForeground: Color(0xFF3A3A58),
        ),
        const SizedBox(height: 20),
        const SectionTitle('Upcoming deadlines'),
        const SizedBox(height: 12),
        const _DeadlineCard(
          title: 'Assignment 2',
          detail: 'Database Systems · Tue 24 Nov, 11:59 PM',
          reminder: 'Reminder 1 day before',
          badge: '3 days',
          badgeBackground: AppColors.amberSoft,
          badgeForeground: AppColors.amberInk,
        ),
        const SizedBox(height: 8),
        const _DeadlineCard(
          title: 'Quiz 1',
          detail: 'Probability & Statistics · Thu 26 Nov',
          reminder: 'Reminder 2 days before',
          badge: '5 days',
          badgeBackground: AppColors.primarySoft,
          badgeForeground: Color.fromARGB(255, 50, 46, 112),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('The task form comes in the next step.')),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Add task or deadline'),
        ),
      ],
    );
  }
}

class _DayButton extends StatelessWidget {
  const _DayButton(
      {required this.day, required this.selected, required this.onTap});

  final _Day day;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: '${day.name} ${day.number}',
      child: Material(
        color: selected
            ? const Color.fromARGB(255, 54, 51, 110)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: SizedBox(
            height: 72,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day.name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : AppColors.muted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${day.number}',
                  style: AppTheme.heading(18,
                      color: selected ? Colors.white : AppColors.ink),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: day.dot ?? Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({
    required this.time,
    required this.length,
    required this.title,
    required this.detail,
    required this.tag,
    required this.tagBackground,
    required this.tagForeground,
  });

  final String time;
  final String length;
  final String title;
  final String detail;
  final String tag;
  final Color tagBackground;
  final Color tagForeground;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          SizedBox(
            width: 62,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text(length,
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.muted)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(detail,
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.muted)),
              ],
            ),
          ),
          Pill(tag, background: tagBackground, foreground: tagForeground),
        ],
      ),
    );
  }
}

class _DeadlineCard extends StatelessWidget {
  const _DeadlineCard({
    required this.title,
    required this.detail,
    required this.reminder,
    required this.badge,
    required this.badgeBackground,
    required this.badgeForeground,
  });

  final String title;
  final String detail;
  final String reminder;
  final String badge;
  final Color badgeBackground;
  final Color badgeForeground;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(detail,
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.muted)),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.notifications_none,
                        size: 14, color: Color.fromARGB(255, 55, 50, 112)),
                    const SizedBox(width: 4),
                    Text(
                      reminder,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 56, 51, 112),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Pill(badge, background: badgeBackground, foreground: badgeForeground),
        ],
      ),
    );
  }
}
