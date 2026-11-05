import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination _destination = CruiseDestination.sample();

  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;

  CruiseDestination get destination => _destination;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  final List<String> packageOptions = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  void incrementRating() {
    _destination.ratingCount++;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedPackage(String package) {
    _selectedPackage = package;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
