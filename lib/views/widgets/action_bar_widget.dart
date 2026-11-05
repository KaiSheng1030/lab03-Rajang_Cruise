import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  const ActionBarWidget({super.key});

  void _showActionSnackBar(BuildContext context, String actionName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$actionName action tapped'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(
            context,
            icon: Icons.call,
            label: 'CALL',
            color: primaryColor,
            onTap: () => _showActionSnackBar(context, 'CALL'),
          ),
          _buildActionButton(
            context,
            icon: Icons.directions,
            label: 'ROUTE',
            color: primaryColor,
            onTap: () => _showActionSnackBar(context, 'ROUTE'),
          ),
          _buildActionButton(
            context,
            icon: Icons.share,
            label: 'SHARE',
            color: primaryColor,
            onTap: () => _showActionSnackBar(context, 'SHARE'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
