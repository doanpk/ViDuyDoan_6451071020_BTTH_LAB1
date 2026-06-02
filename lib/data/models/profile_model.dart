class Profile {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String aboutMe;
  final String workExperience;
  final String education;
  final String skill;
  final String language;

  Profile({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.aboutMe = '',
    this.workExperience = '',
    this.education = '',
    this.skill = '',
    this.language = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'aboutMe': aboutMe,
      'workExperience': workExperience,
      'education': education,
      'skill': skill,
      'language': language,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      aboutMe: map['aboutMe'] ?? '',
      workExperience: map['workExperience'] ?? '',
      education: map['education'] ?? '',
      skill: map['skill'] ?? '',
      language: map['language'] ?? '',
    );
  }
}
