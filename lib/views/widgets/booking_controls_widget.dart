import 'package:flutter/material.dart';

class BookingControlsWidget extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedPackage;
  final List<String> packageOptions;
  final bool isDarkMode;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String?> onPackageSelected;
  final ValueChanged<bool> onThemeToggled;

  const BookingControlsWidget({
    super.key,
    required this.selectedDate,
    required this.selectedPackage,
    required this.packageOptions,
    required this.isDarkMode,
    required this.onDateSelected,
    required this.onPackageSelected,
    required this.onThemeToggled,
  });

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.isBefore(now) ? now : selectedDate,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Interactive Booking Controls',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Visit Date Picker
              InkWell(
                onTap: () => _pickDate(context),
                borderRadius: BorderRadius.circular(8),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Visit Date',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Cruise Package Dropdown
              DropdownButtonFormField<String>(
                value: selectedPackage,
                decoration: const InputDecoration(
                  labelText: 'Cruise Package',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_boat),
                ),
                items: packageOptions.map((String package) {
                  return DropdownMenuItem<String>(
                    value: package,
                    child: Text(package),
                  );
                }).toList(),
                onChanged: onPackageSelected,
              ),
              const SizedBox(height: 12),
              // Dark Mode Switch
              SwitchListTile(
                title: const Text('Dark Mode'),
                secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                value: isDarkMode,
                onChanged: onThemeToggled,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
