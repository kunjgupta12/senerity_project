class User {
  String image;
  String name;
  String birthdate;
  String bloodtype;
  String weightandheight;
  String cityandcountry;
  String email;
  String phone;
  String aboutMeDescription;

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.birthdate,
    required this.bloodtype,
    required this.weightandheight,
    required this.cityandcountry,
    required this.email,
    required this.phone,
    required this.aboutMeDescription,
  });

  User copy({
    String? imagePath,
    String? name,
    String? birthdate,
    String? bloodtype,
    String? weightandheight,
    String? cityandcountry,
    String? phone,
    String? email,
    String? about,
  }) =>
      User(
        image: imagePath ?? this.image,
        name: name ?? this.name,
        birthdate: name ?? this.birthdate,
        bloodtype: name ?? this.bloodtype,
        weightandheight: name ?? this.weightandheight,
        cityandcountry: name ?? this.cityandcountry,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        aboutMeDescription: about ?? this.aboutMeDescription,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        image: json['imagePath'],
        name: json['name'],
        birthdate: json['birthdate'],
        bloodtype: json['bloodtype'],
        weightandheight: json['weightandheight'],
        cityandcountry: json['cityandcountry'],
        email: json['email'],
        aboutMeDescription: json['about'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': image,
        'name': name,
        'birthdate': birthdate,
        'bloodtype': bloodtype,
        'weightandheight': weightandheight,
        'cityandcountry': cityandcountry,
        'email': email,
        'about': aboutMeDescription,
        'phone': phone,
      };
}
