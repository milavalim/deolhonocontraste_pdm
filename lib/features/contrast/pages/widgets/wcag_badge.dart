import 'package:flutter/material.dart';
import 'package:pdm1_010526/core/constants/app_colors.dart';

/// Widget que exibe o selo de conformidade WCAG (A, AA, AAA).
class WcagBadge extends StatelessWidget {
  final String label;
  final bool isPassed;

  const WcagBadge({super.key, required this.label, required this.isPassed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPassed ? AppColors.success : AppColors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPassed ? Icons.check_circle : Icons.cancel,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
