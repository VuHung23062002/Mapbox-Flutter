class DamagePoint {
  int? id;
  double? lat;
  double? lon;
  String? type;
  double? confidence;
  int? detectedTime;
  String? updatedTime;
  String? status;
  String? deviceId;
  int? isProcessingApp;
  String? imageData;

  DamagePoint(
      {this.id,
        this.lat,
        this.lon,
        this.type,
        this.confidence,
        this.detectedTime,
        this.updatedTime,
        this.status,
        this.deviceId,
        this.isProcessingApp,
        this.imageData});

  DamagePoint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    lon = json['lon'];
    type = json['type'];
    confidence = json['confidence'];
    detectedTime = json['detectedTime'];
    updatedTime = json['updatedTime'];
    status = json['status'];
    deviceId = json['deviceId'];
    isProcessingApp = json['isProcessingApp'];
    imageData = json['imageData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lat'] = lat;
    data['lon'] = lon;
    data['type'] = type;
    data['confidence'] = confidence;
    data['detectedTime'] = detectedTime;
    data['updatedTime'] = updatedTime;
    data['status'] = status;
    data['deviceId'] = deviceId;
    data['isProcessingApp'] = isProcessingApp;
    data['imageData'] = imageData;
    return data;
  }
}