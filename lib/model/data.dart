
class Data{
  String? name;
  String? company;
  String? mobile_image;
  String? description;

  Data({
    required this.name,
    required this.mobile_image,
    required this.description,
    required this.company,
  });

  factory Data.fromJson(Map<String, dynamic>json){
    return Data(
      name : json["name"] == null ? null : json["name"],
      description : json["description"] == null ? null : json["description"],
      mobile_image : json["mobile_image"]  == null ? null : json["mobile_image"],
      company: json["company"] == null ? null : json["company"],
    );
  }
}