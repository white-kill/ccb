class KhData {
  KhData({
      this.data1,
      this.data2, 
      this.data3, 
      this.data4, 
      this.data5, 
      this.data6, 
      this.data7, 
      this.data9, 
      this.data8,
      this.data10,
  });

  KhData.fromJson(dynamic json) {
    data1 = json['data1'];
    data2 = json['data2'];
    data3 = json['data3'];
    data4 = json['data4'];
    data5 = json['data5'];
    data6 = json['data6'];
    data7 = json['data7'];
    data9 = json['data9'];
    data8 = json['data8'];
    data8 = json['data10'];
  }
  String? data1;
  String? data2;
  String? data3;
  String? data4;
  String? data5;
  String? data6;
  String? data7;
  String? data9;
  String? data8;
  String? data10;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data1'] = data1;
    map['data2'] = data2;
    map['data3'] = data3;
    map['data4'] = data4;
    map['data5'] = data5;
    map['data6'] = data6;
    map['data7'] = data7;
    map['data9'] = data9;
    map['data8'] = data8;
    map['data10'] = data10;
    return map;
  }

}