class CollegeLocationModel {
  final String name;
  final double lat;
  final double lng;
  final List<String> administrations;

  const CollegeLocationModel({
    required this.name,
    required this.lat,
    required this.lng,
    this.administrations = const [],
  });

  /// Factory constructor to create a [CollegeLocationModel] from a JSON map.
  factory CollegeLocationModel.fromJson(Map<String, dynamic> json) {
    return CollegeLocationModel(
      name: json['name'] as String? ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      administrations: (json['administrations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }

  /// Converts this [CollegeLocationModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lat': lat,
      'lng': lng,
      'administrations': administrations,
    };
  }

  /// Creates a copy of this [CollegeLocationModel] with the given fields replaced.
  CollegeLocationModel copyWith({
    String? name,
    double? lat,
    double? lng,
    List<String>? administrations,
  }) {
    return CollegeLocationModel(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      administrations: administrations ?? this.administrations,
    );
  }

  @override
  String toString() =>
      'CollegeLocationModel(name: $name, lat: $lat, lng: $lng, administrations: ${administrations.length})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CollegeLocationModel &&
        other.name == name &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode => Object.hash(name, lat, lng);
}
