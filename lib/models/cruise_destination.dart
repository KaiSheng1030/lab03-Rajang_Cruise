class CruiseDestination {
  final String name;
  final String location;
  final String description;
  int ratingCount;

  CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.ratingCount,
  });

  factory CruiseDestination.sample() {
    return CruiseDestination(
      name: 'Rajang River Express Cruise',
      location: 'Sibu, Sarawak',
      description: 'Experience the majestic Rajang River, the longest river in Malaysia, exploring local cultures and scenic waterways.',
      ratingCount: 41,
    );
  }
}
