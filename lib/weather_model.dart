/// location : {"name":"Lahore","region":"Punjab","country":"Pakistan","lat":31.55,"lon":74.34,"tz_id":"Asia/Karachi","localtime_epoch":1684908711,"localtime":"2023-05-24 11:11"}
/// current : {"last_updated_epoch":1684908000,"last_updated":"2023-05-24 11:00","temp_c":30.0,"temp_f":86.0,"is_day":1,"condition":{"text":"Mist","icon":"//cdn.weatherapi.com/weather/64x64/day/143.png","code":1030},"wind_mph":15.0,"wind_kph":24.1,"wind_degree":160,"wind_dir":"SSE","pressure_mb":1006.0,"pressure_in":29.71,"precip_mm":0.0,"precip_in":0.0,"humidity":49,"cloud":50,"feelslike_c":27.8,"feelslike_f":82.0,"vis_km":5.0,"vis_miles":3.0,"uv":10.0,"gust_mph":5.6,"gust_kph":9.0}

class WeatherModel {
  WeatherModel({
      Location? location, 
      Current? current,}){
    _location = location;
    _current = current;
}

  WeatherModel.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _current = json['current'] != null ? Current.fromJson(json['current']) : null;
  }
  Location? _location;
  Current? _current;
WeatherModel copyWith({  Location? location,
  Current? current,
}) => WeatherModel(  location: location ?? _location,
  current: current ?? _current,
);
  Location? get location => _location;
  Current? get current => _current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_current != null) {
      map['current'] = _current?.toJson();
    }
    return map;
  }

}

/// last_updated_epoch : 1684908000
/// last_updated : "2023-05-24 11:00"
/// temp_c : 30.0
/// temp_f : 86.0
/// is_day : 1
/// condition : {"text":"Mist","icon":"//cdn.weatherapi.com/weather/64x64/day/143.png","code":1030}
/// wind_mph : 15.0
/// wind_kph : 24.1
/// wind_degree : 160
/// wind_dir : "SSE"
/// pressure_mb : 1006.0
/// pressure_in : 29.71
/// precip_mm : 0.0
/// precip_in : 0.0
/// humidity : 49
/// cloud : 50
/// feelslike_c : 27.8
/// feelslike_f : 82.0
/// vis_km : 5.0
/// vis_miles : 3.0
/// uv : 10.0
/// gust_mph : 5.6
/// gust_kph : 9.0

class Current {
  Current({
      num? lastUpdatedEpoch, 
      String? lastUpdated, 
      num? tempC, 
      num? tempF, 
      num? isDay, 
      Condition? condition, 
      num? windMph, 
      num? windKph, 
      num? windDegree, 
      String? windDir, 
      num? pressureMb, 
      num? pressureIn, 
      num? precipMm, 
      num? precipIn, 
      num? humidity, 
      num? cloud, 
      num? feelslikeC, 
      num? feelslikeF, 
      num? visKm, 
      num? visMiles, 
      num? uv, 
      num? gustMph, 
      num? gustKph,}){
    _lastUpdatedEpoch = lastUpdatedEpoch;
    _lastUpdated = lastUpdated;
    _tempC = tempC;
    _tempF = tempF;
    _isDay = isDay;
    _condition = condition;
    _windMph = windMph;
    _windKph = windKph;
    _windDegree = windDegree;
    _windDir = windDir;
    _pressureMb = pressureMb;
    _pressureIn = pressureIn;
    _precipMm = precipMm;
    _precipIn = precipIn;
    _humidity = humidity;
    _cloud = cloud;
    _feelslikeC = feelslikeC;
    _feelslikeF = feelslikeF;
    _visKm = visKm;
    _visMiles = visMiles;
    _uv = uv;
    _gustMph = gustMph;
    _gustKph = gustKph;
}

  Current.fromJson(dynamic json) {
    _lastUpdatedEpoch = json['last_updated_epoch'];
    _lastUpdated = json['last_updated'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _isDay = json['is_day'];
    _condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    _windMph = json['wind_mph'];
    _windKph = json['wind_kph'];
    _windDegree = json['wind_degree'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _pressureIn = json['pressure_in'];
    _precipMm = json['precip_mm'];
    _precipIn = json['precip_in'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _uv = json['uv'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
  }
  num? _lastUpdatedEpoch;
  String? _lastUpdated;
  num? _tempC;
  num? _tempF;
  num? _isDay;
  Condition? _condition;
  num? _windMph;
  num? _windKph;
  num? _windDegree;
  String? _windDir;
  num? _pressureMb;
  num? _pressureIn;
  num? _precipMm;
  num? _precipIn;
  num? _humidity;
  num? _cloud;
  num? _feelslikeC;
  num? _feelslikeF;
  num? _visKm;
  num? _visMiles;
  num? _uv;
  num? _gustMph;
  num? _gustKph;
Current copyWith({  num? lastUpdatedEpoch,
  String? lastUpdated,
  num? tempC,
  num? tempF,
  num? isDay,
  Condition? condition,
  num? windMph,
  num? windKph,
  num? windDegree,
  String? windDir,
  num? pressureMb,
  num? pressureIn,
  num? precipMm,
  num? precipIn,
  num? humidity,
  num? cloud,
  num? feelslikeC,
  num? feelslikeF,
  num? visKm,
  num? visMiles,
  num? uv,
  num? gustMph,
  num? gustKph,
}) => Current(  lastUpdatedEpoch: lastUpdatedEpoch ?? _lastUpdatedEpoch,
  lastUpdated: lastUpdated ?? _lastUpdated,
  tempC: tempC ?? _tempC,
  tempF: tempF ?? _tempF,
  isDay: isDay ?? _isDay,
  condition: condition ?? _condition,
  windMph: windMph ?? _windMph,
  windKph: windKph ?? _windKph,
  windDegree: windDegree ?? _windDegree,
  windDir: windDir ?? _windDir,
  pressureMb: pressureMb ?? _pressureMb,
  pressureIn: pressureIn ?? _pressureIn,
  precipMm: precipMm ?? _precipMm,
  precipIn: precipIn ?? _precipIn,
  humidity: humidity ?? _humidity,
  cloud: cloud ?? _cloud,
  feelslikeC: feelslikeC ?? _feelslikeC,
  feelslikeF: feelslikeF ?? _feelslikeF,
  visKm: visKm ?? _visKm,
  visMiles: visMiles ?? _visMiles,
  uv: uv ?? _uv,
  gustMph: gustMph ?? _gustMph,
  gustKph: gustKph ?? _gustKph,
);
  num? get lastUpdatedEpoch => _lastUpdatedEpoch;
  String? get lastUpdated => _lastUpdated;
  num? get tempC => _tempC;
  num? get tempF => _tempF;
  num? get isDay => _isDay;
  Condition? get condition => _condition;
  num? get windMph => _windMph;
  num? get windKph => _windKph;
  num? get windDegree => _windDegree;
  String? get windDir => _windDir;
  num? get pressureMb => _pressureMb;
  num? get pressureIn => _pressureIn;
  num? get precipMm => _precipMm;
  num? get precipIn => _precipIn;
  num? get humidity => _humidity;
  num? get cloud => _cloud;
  num? get feelslikeC => _feelslikeC;
  num? get feelslikeF => _feelslikeF;
  num? get visKm => _visKm;
  num? get visMiles => _visMiles;
  num? get uv => _uv;
  num? get gustMph => _gustMph;
  num? get gustKph => _gustKph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_updated_epoch'] = _lastUpdatedEpoch;
    map['last_updated'] = _lastUpdated;
    map['temp_c'] = _tempC;
    map['temp_f'] = _tempF;
    map['is_day'] = _isDay;
    if (_condition != null) {
      map['condition'] = _condition?.toJson();
    }
    map['wind_mph'] = _windMph;
    map['wind_kph'] = _windKph;
    map['wind_degree'] = _windDegree;
    map['wind_dir'] = _windDir;
    map['pressure_mb'] = _pressureMb;
    map['pressure_in'] = _pressureIn;
    map['precip_mm'] = _precipMm;
    map['precip_in'] = _precipIn;
    map['humidity'] = _humidity;
    map['cloud'] = _cloud;
    map['feelslike_c'] = _feelslikeC;
    map['feelslike_f'] = _feelslikeF;
    map['vis_km'] = _visKm;
    map['vis_miles'] = _visMiles;
    map['uv'] = _uv;
    map['gust_mph'] = _gustMph;
    map['gust_kph'] = _gustKph;
    return map;
  }

}

/// text : "Mist"
/// icon : "//cdn.weatherapi.com/weather/64x64/day/143.png"
/// code : 1030

class Condition {
  Condition({
      String? text, 
      String? icon, 
      num? code,}){
    _text = text;
    _icon = icon;
    _code = code;
}

  Condition.fromJson(dynamic json) {
    _text = json['text'];
    _icon = json['icon'];
    _code = json['code'];
  }
  String? _text;
  String? _icon;
  num? _code;
Condition copyWith({  String? text,
  String? icon,
  num? code,
}) => Condition(  text: text ?? _text,
  icon: icon ?? _icon,
  code: code ?? _code,
);
  String? get text => _text;
  String? get icon => _icon;
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['icon'] = _icon;
    map['code'] = _code;
    return map;
  }

}

/// name : "Lahore"
/// region : "Punjab"
/// country : "Pakistan"
/// lat : 31.55
/// lon : 74.34
/// tz_id : "Asia/Karachi"
/// localtime_epoch : 1684908711
/// localtime : "2023-05-24 11:11"

class Location {
  Location({
      String? name, 
      String? region, 
      String? country, 
      num? lat, 
      num? lon, 
      String? tzId, 
      num? localtimeEpoch, 
      String? localtime,}){
    _name = name;
    _region = region;
    _country = country;
    _lat = lat;
    _lon = lon;
    _tzId = tzId;
    _localtimeEpoch = localtimeEpoch;
    _localtime = localtime;
}

  Location.fromJson(dynamic json) {
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _tzId = json['tz_id'];
    _localtimeEpoch = json['localtime_epoch'];
    _localtime = json['localtime'];
  }
  String? _name;
  String? _region;
  String? _country;
  num? _lat;
  num? _lon;
  String? _tzId;
  num? _localtimeEpoch;
  String? _localtime;
Location copyWith({  String? name,
  String? region,
  String? country,
  num? lat,
  num? lon,
  String? tzId,
  num? localtimeEpoch,
  String? localtime,
}) => Location(  name: name ?? _name,
  region: region ?? _region,
  country: country ?? _country,
  lat: lat ?? _lat,
  lon: lon ?? _lon,
  tzId: tzId ?? _tzId,
  localtimeEpoch: localtimeEpoch ?? _localtimeEpoch,
  localtime: localtime ?? _localtime,
);
  String? get name => _name;
  String? get region => _region;
  String? get country => _country;
  num? get lat => _lat;
  num? get lon => _lon;
  String? get tzId => _tzId;
  num? get localtimeEpoch => _localtimeEpoch;
  String? get localtime => _localtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['region'] = _region;
    map['country'] = _country;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['tz_id'] = _tzId;
    map['localtime_epoch'] = _localtimeEpoch;
    map['localtime'] = _localtime;
    return map;
  }

}