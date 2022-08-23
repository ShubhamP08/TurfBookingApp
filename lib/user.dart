

class Hello {
  final String imagePath;
  final String name;
  final String email;
  final String about;

  const Hello(
      {required this.imagePath,
      required this.name,
      required this.email,
      required this.about});

  Hello copy({
    String? imagePath,
    String? name,
    String? email,
    String? about,
  }) =>
      Hello(
          imagePath: imagePath ?? this.imagePath,
          name: name ?? this.name,
          email: email ?? this.email,
          about: about ?? this.about);
  
  static Hello fromJson(Map<String, dynamic> json) => Hello(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'about': about,
      };
}
