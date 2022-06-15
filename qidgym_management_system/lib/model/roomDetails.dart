class Room {
  String Image;
  String Desc;
  String Price;

  Room({
    this.Image = "",
    this.Desc = "",
    this.Price = "",
  });

  static Room fromJson(Map<String, dynamic> json) =>
      Room(Image: json['Image'], Desc: json['Desc'], Price: json['Price']);

  Map<String, dynamic> toJson() {
    return {'Image': Image, 'Desc': Desc, 'Price': Price};
  }
}
