import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeadlineSelector extends StatelessWidget {
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;

  final DateTime firstDate;
  final DateTime lastDate;

  final String labelText;
  final String hintText;

  DeadlineSelector({
    super.key,
    required this.value,
    required this.onChanged,
    DateTime? firstDate,
    DateTime? lastDate,
    this.labelText = 'Deadline',
    this.hintText = 'Select deadline',
  })  : firstDate = firstDate ?? DateTime(2000, 1, 1),
        lastDate = lastDate ?? DateTime(2100, 12, 31);

  @override
  Widget build(BuildContext context) {
    final text = _formatDate(context, value);

    return InkWell(
      onTap: () => _pickDate(context),
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: const Icon(Icons.calendar_today),
          border: const OutlineInputBorder(),
        ),
        child: Text(
          text.isEmpty ? hintText : text,
          style: TextStyle(
            color: text.isEmpty
                ? Theme.of(context).hintColor
                : Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();

    final safeInitial = _clampDate(value ?? now, firstDate, lastDate);

    final picked = await showDatePicker(
      context: context,
      initialDate: safeInitial,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      onChanged(DateTime(picked.year, picked.month, picked.day));
    }
  }

  static DateTime _clampDate(DateTime date, DateTime min, DateTime max) {
    if (date.isBefore(min)) return min;
    if (date.isAfter(max)) return max;
    return date;
  }

  static String _formatDate(BuildContext context, DateTime? date) {
    if (date == null) return '';
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.yMd(locale).format(date);
  }
}
