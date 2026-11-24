import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class _Entry {
  _Entry(this.name, this.credits, this.grade);

  final String name;
  final int credits;
  String grade;
}

class GpaScreen extends StatefulWidget {
  const GpaScreen({super.key});

  @override
  State<GpaScreen> createState() => _GpaScreenState();
}

class _GpaScreenState extends State<GpaScreen> {
  late final List<_Entry> _entries = [
    for (final c in sampleCourses) _Entry(c.name, c.credits, sampleGrades[c.code] ?? 'A'),
  ];

  int get _credits => _entries.fold<int>(0, (sum, e) => sum + e.credits);

  double get _points =>
      _entries.fold<double>(0, (sum, e) => sum + (gradePoints[e.grade] ?? 0) * e.credits);

  double get _semesterGpa => _credits == 0 ? 0 : _points / _credits;

  double get _cumulativeGpa {
    final totalCredits = previousCredits + _credits;
    if (totalCredits == 0) return 0;
    return (previousGpa * previousCredits + _points) / totalCredits;
  }

  Future<void> _addCourse() async {
    final nameController = TextEditingController();
    var credits = 3;

    final added = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add course'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Course name'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                value: credits,
                decoration: const InputDecoration(labelText: 'Credit hours'),
                items: [
                  for (final n in [1, 2, 3, 4]) DropdownMenuItem(value: n, child: Text('$n')),
                ],
                onChanged: (value) => setDialogState(() => credits = value ?? credits),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(minimumSize: const Size(88, 44)),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );

    final name = nameController.text.trim();
    nameController.dispose();
    if (!mounted) return;
    if (added == true && name.isNotEmpty) {
      setState(() => _entries.add(_Entry(name, credits, 'A')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      children: [
        const ScreenHeader(
          title: 'GPA calculator',
          subtitle: 'Level 2 · Semester 1 · 4.0 scale',
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 54, 51, 112),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: _GpaFigure(
                      label: 'Semester GPA',
                      value: _semesterGpa.toStringAsFixed(2),
                      size: 48,
                    ),
                  ),
                  Expanded(
                    child: _GpaFigure(
                      label: 'Cumulative GPA',
                      value: _cumulativeGpa.toStringAsFixed(2),
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Includes $previousCredits previous credit hours at a '
                '${previousGpa.toStringAsFixed(2)} GPA',
                style: const TextStyle(fontSize: 12, color: AppColors.onPrimarySoft),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            const Expanded(child: SectionTitle('Grades')),
            Text(
              '$_credits credit hours',
              style: const TextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ],
        ),
        const SizedBox(height: 12),
        for (final entry in _entries) ...[
          AppCard(
            padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.name,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${entry.credits} credits',
                        style: const TextStyle(fontSize: 12, color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
                _GradePicker(
                  value: entry.grade,
                  label: 'Grade for ${entry.name}',
                  onChanged: (grade) => setState(() => entry.grade = grade),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 4),
        OutlinedButton.icon(
          onPressed: _addCourse,
          icon: const Icon(Icons.add),
          label: const Text('Add course'),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            foregroundColor: const Color.fromARGB(255, 55, 50, 112),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Color(0xFFC7C5F7)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _GpaFigure extends StatelessWidget {
  const _GpaFigure({required this.label, required this.value, required this.size});

  final String label;
  final String value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.onPrimarySoft,
          ),
        ),
        const SizedBox(height: 2),
        Text(value, style: AppTheme.heading(size, color: Colors.white)),
      ],
    );
  }
}

class _GradePicker extends StatelessWidget {
  const _GradePicker({
    required this.value,
    required this.label,
    required this.onChanged,
  });

  final String value;
  final String label;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: Container(
        width: 84,
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.bg,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            borderRadius: BorderRadius.circular(12),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
            items: [
              for (final grade in gradePoints.keys)
                DropdownMenuItem(value: grade, child: Text(grade)),
            ],
            onChanged: (grade) {
              if (grade != null) onChanged(grade);
            },
          ),
        ),
      ),
    );
  }
}
