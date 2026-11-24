import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class _Category {
  const _Category(this.label, this.icon);

  final String label;
  final IconData icon;
}

const _categories = <_Category>[
  _Category('Registration', Icons.assignment_outlined),
  _Category('Fees & payments', Icons.credit_card_outlined),
  _Category('Student affairs', Icons.groups_outlined),
  _Category('Library', Icons.account_balance_outlined),
  _Category('Exams & results', Icons.fact_check_outlined),
  _Category('Campus map', Icons.place_outlined),
];

const _faqs = <String>[
  'How do I register for courses?',
  'Where do I find my exam schedule?',
  'How do I request an official transcript?',
];

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int? _openFaq = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      children: [
        const ScreenHeader(
          title: 'University guide',
          subtitle: 'Example University · Faculty of Computing',
        ),
        const SizedBox(height: 14),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search services and questions',
            prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 51, 48, 112)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color.fromARGB(255, 51, 48, 112), width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 14),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.05,
          children: [
            for (final category in _categories)
              AppCard(
                radius: 20,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primarySoft,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(category.icon, color: const Color.fromARGB(255, 51, 48, 112), size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        category.label,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
        const SectionTitle('Common questions'),
        const SizedBox(height: 12),
        for (var i = 0; i < _faqs.length; i++) ...[
          _FaqTile(
            question: _faqs[i],
            open: _openFaq == i,
            onTap: () => setState(() => _openFaq = _openFaq == i ? null : i),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.question, required this.open, required this.onTap});

  final String question;
  final bool open;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(
                open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppColors.muted,
              ),
            ],
          ),
          if (open) ...[
            const SizedBox(height: 8),
            const Text(
              'Answers are written by your university admin and appear here, '
              'so each university shows its own steps.',
              style: TextStyle(fontSize: 13, height: 1.5, color: AppColors.muted),
            ),
          ],
        ],
      ),
    );
  }
}
