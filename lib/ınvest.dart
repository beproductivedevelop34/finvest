class Invest {
  String name;
  int tahmin;
  Invest(this.name, this.tahmin);
  factory Invest.fromJson(Map<dynamic, dynamic> map) {
    return Invest(map["name"], map["tahmin"]);
  }
}
