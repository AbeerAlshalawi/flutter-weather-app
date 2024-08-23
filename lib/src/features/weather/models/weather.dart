class Weather {
  final String description;
  final num? temp;
  final String iconCode;
  final int code;

  final num? feelsLike;
  final num humidity;
  final num windSpeed;

  final num? minTemp;
  final num? maxTemp;

  final String? timestamp;
  final String? datetime;

  Weather({
    required this.description,
    this.temp,
    required this.iconCode,
    required this.code,
    this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    this.minTemp,
    this.maxTemp,
    this.timestamp,
    this.datetime,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather']['description'],
      temp: json['temp'],
      iconCode: json['weather']['icon'],
      code: json['weather']['code'],
      feelsLike: json['app_temp'],
      humidity: json['rh'],
      windSpeed: json['wind_spd'],
      minTemp: json['min_temp'],
      maxTemp: json['max_temp'],
      timestamp: json['timestamp_local'],
      datetime: json['datetime'],
    );
  }

  bool get isDay {
    return iconCode.endsWith('d');
  }

  String get imagePath {
    String imageName;
    if (code <= 202) {
      imageName = 'thunder_shower';
    }
    else if (code <= 233) {
      imageName = 'thunderstorm';
    }
    else if (code <= 302) {
      imageName = 'shower_rain';
    }
    else if (code <= 522) {
      imageName = 'rain';
    }
    else if (code <= 623) {
      imageName = 'snow';
    }
    else if (code <= 751) {
      imageName = 'mist';
    }
    else if (code <= 800) {
      imageName = 'clear';
    }
    else if (code <= 802) {
      imageName = 'partly_cloudy';
    }
    else if (code <= 804) {
      imageName = 'mostly_cloudy';
    }
    else {
      imageName = 'unknown';
    }
    return 'assets/icons/${imageName}_${isDay? 'd' : 'n'}.png';
  }
}
