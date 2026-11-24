import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  bool _fullPlan = false;

  @override
  Widget build(BuildContext context) {
    final totalCredits = sampleCourses.fold<int>(0, (sum, c) => sum + c.credits);

    return ScreenPage(
      children: [
        ScreenHeader(
          title: 'My courses',
          subtitle:
              'Level 2 · Semester 1 · ${sampleCourses.length} courses · $totalCredits credit hours',
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFE9E9F4),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: _SegmentButton(
                  label: 'This semester',
                  selected: !_fullPlan,
                  onTap: () => setState(() => _fullPlan = false),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: _SegmentButton(
                  label: 'Full study plan',
                  selected: _fullPlan,
                  onTap: () => setState(() => _fullPlan = true),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (_fullPlan)
          const AppCard(
            child: Text(
              'The full study plan will list every level of your program once the '
              'backend is connected.',
              style: TextStyle(fontSize: 14, height: 1.5, color: AppColors.muted),
            ),
          )
        else
          for (final course in sampleCourses) ...[
            AppCard(
              onTap: () {},
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.code,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            color: Color.fromARGB(255, 51, 48, 112),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          course.name,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          course.meta,
                          style: const TextStyle(fontSize: 12, color: AppColors.muted),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.muted),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
      ],
    );
  }
}

class _SegmentButton extends StatelessWidget {
  const _SegmentButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: SizedBox(
            height: 44,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                  color: selected ? AppColors.ink : const Color(0xFF4A4A6A),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
