
class Details{
  String? name;
  String? company;
  String? mobile_image;
  String? description;
  double? price;

  Details({
    required this.name,
    required this.mobile_image,
    required this.description,
    required this.company,
    required this.price,

  });

  factory Details.fromJson(Map<String, dynamic>json){
    return Details(
      name : json["name"] == null ? null : json["name"],
      description : json["description"] == null ? null : json["description"],
      mobile_image : json["mobile_image"]  == null ? null : json["mobile_image"],
      company: json["company"] == null ? null : json["company"],
      price: json["price"] == null ? null : json["price"],
    );
  }
}