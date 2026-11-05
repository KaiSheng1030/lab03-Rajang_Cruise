import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const RajangRiverCruiseApp());
}

class RajangRiverCruiseApp extends StatefulWidget {
  const RajangRiverCruiseApp({super.key});

  @override
  State<RajangRiverCruiseApp> createState() => _RajangRiverCruiseAppState();
}

class _RajangRiverCruiseAppState extends State<RajangRiverCruiseApp> {
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          title: 'Rajang River Cruise',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}
