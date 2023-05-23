import 'dart:convert';

class OrderLocation {
  double latitude;
  double longitude;
  DateTime date;
  OrderLocation({
    required this.latitude,
    required this.longitude,
    required this.date,
  });

  OrderLocation copyWith({
    double? latitude,
    double? longitude,
    DateTime? date,
  }) {
    return OrderLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory OrderLocation.fromMap(Map<String, dynamic> map) {
    return OrderLocation(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLocation.fromJson(String source) =>
      OrderLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrderLocation(latitude: $latitude, longitude: $longitude, date: $date)';

  @override
  bool operator ==(covariant OrderLocation other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.date == date;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ date.hashCode;
}
