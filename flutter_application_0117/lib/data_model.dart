class Station {
  String siteName = '';
  String county = '';
  String status = '';
  String importDate = '';
  String windSpeed = ''; 
  int aqi = -1;


  Station(this.siteName, this.county, this.status, this.importDate, this.windSpeed);

  Station.fromJson(Map<String, dynamic> json) {
    siteName = json['siteName'];
    county = json['county'];
    status = json['status'];
    importDate = json['importDate'];
    windSpeed = json['windSpeed'];
    aqi = json['aqi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['siteName'] = this.siteName;
    data['county'] = this.county;
    data['status'] = this.status;
    data['importDate'] = this.importDate;
    data['windSpeed'] = this.windSpeed;
    data['aqi'] = this.aqi;
    return data;
  }
}