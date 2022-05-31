class userProfile {
  final String name;
  final String email;
  final String nric;
  final String address;
  final String phone;
  final String userType;
  final String dpUrl;

  userProfile(
      {required this.name,
      required this.email,
      required this.nric,
      required this.address,
      required this.phone,
      required this.userType,
      required this.dpUrl});

  userProfile.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['name'],
        email = parsedJSON['email'],
        nric = parsedJSON['nric'],
        address = parsedJSON['address'],
        phone = parsedJSON['phone'],
        userType = parsedJSON['userType'],
        dpUrl = parsedJSON['dpUrl'];
}
