class UserModel {
  String name, ageGroup, country, gender, occupation, note, url;
  List<String> interests;

  UserModel({
    required this.name,
    required this.ageGroup,
    required this.country,
    required this.gender,
    required this.occupation,
    required this.interests,
    required this.note,
    required this.url,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      name: parsedJson['name'],
      ageGroup: parsedJson['ageGroup'] == null ? null : parsedJson[' ageGroup'],
      country: parsedJson['country'] == null ? null : parsedJson[' country'],
      gender: parsedJson['gender'] == null ? null : parsedJson[' gender'],
      occupation:
          parsedJson['occupation'] == null ? null : parsedJson[' occupation'],
      interests:
          parsedJson['interests'] == null ? null : parsedJson[' interests'],
      note: parsedJson['note'] == null ? null : parsedJson[' note'],
      url: parsedJson['url'] == null ? null : parsedJson[' url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'ageGroup': ageGroup,
        'country': country,
        'gender': gender,
        'occupation': occupation,
        'interests': interests,
        'note': note,
        'url': url,
      };
}
