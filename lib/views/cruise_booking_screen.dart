import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rajang River Cruise'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            final destination = viewModel.destination;
            return OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.landscape) {
                  // Landscape Split-Pane Layout (Figure 2)
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Left Pane: Header Image
                      const Expanded(
                        flex: 1,
                        child: HeaderImageWidget(isLandscape: true),
                      ),
                      // Right Pane: Scrollable details & controls
                      Expanded(
                        flex: 1,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          children: [
                            TitleSectionWidget(
                              name: destination.name,
                              location: destination.location,
                              ratingCount: destination.ratingCount,
                              onIncrementRating: viewModel.incrementRating,
                            ),
                            const Divider(height: 1, indent: 20, endIndent: 20),
                            const ActionBarWidget(),
                            const Divider(height: 1, indent: 20, endIndent: 20),
                            DescriptionWidget(description: destination.description),
                            BookingControlsWidget(
                              selectedDate: viewModel.selectedDate,
                              selectedPackage: viewModel.selectedPackage,
                              packageOptions: viewModel.packageOptions,
                              isDarkMode: viewModel.isDarkMode,
                              onDateSelected: viewModel.setSelectedDate,
                              onPackageSelected: (package) {
                                if (package != null) {
                                  viewModel.setSelectedPackage(package);
                                }
                              },
                              onThemeToggled: viewModel.toggleDarkMode,
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  // Portrait Layout (Figure 1)
                  return ListView(
                    children: [
                      const HeaderImageWidget(),
                      TitleSectionWidget(
                        name: destination.name,
                        location: destination.location,
                        ratingCount: destination.ratingCount,
                        onIncrementRating: viewModel.incrementRating,
                      ),
                      const Divider(height: 1, indent: 20, endIndent: 20),
                      const ActionBarWidget(),
                      const Divider(height: 1, indent: 20, endIndent: 20),
                      DescriptionWidget(description: destination.description),
                      BookingControlsWidget(
                        selectedDate: viewModel.selectedDate,
                        selectedPackage: viewModel.selectedPackage,
                        packageOptions: viewModel.packageOptions,
                        isDarkMode: viewModel.isDarkMode,
                        onDateSelected: viewModel.setSelectedDate,
                        onPackageSelected: (package) {
                          if (package != null) {
                            viewModel.setSelectedPackage(package);
                          }
                        },
                        onThemeToggled: viewModel.toggleDarkMode,
                      ),
                      const SizedBox(height: 24),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
