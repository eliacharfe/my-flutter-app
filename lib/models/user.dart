import 'dart:convert';
import '../packages/default_packages.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final AccountType accountType;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.accountType,
  });

  static getMockData() => User(
        firstName: 'Eliachar',
        lastName: 'Feig',
        email: 'efeig15@gmail.com',
        phone: "+123456789",
        address: "123 Example Street",
        accountType: AccountType.standard,
      );

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? address,
    AccountType? accountType,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      accountType: accountType ?? this.accountType,
    );
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "address": address,
        "accountType": accountType.displayName,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        accountType:
            json['accountType'] != null ? AccountTypeExtension.fromString(json['accountType']) : AccountType.standard,
      );
}

class UserProvider extends ChangeNotifier {
  User _user = User.getMockData();

  User get user => _user;

  void updateUser({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? address,
    AccountType? accountType,
  }) {
    _user = _user.copyWith(
      firstName: firstName ?? _user.firstName,
      lastName: lastName ?? _user.lastName,
      email: email ?? _user.email,
      phone: phone ?? _user.phone,
      address: address ?? _user.address,
      accountType: accountType ?? _user.accountType,
    );
    notifyListeners();
    _saveUserToPrefs();
  }

  Future<void> _saveUserToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(_user.toJson()));
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      _user = User.fromJson(jsonDecode(userJson));
    } else {
      _user = User.getMockData();
    }
    notifyListeners();
  }
}

enum AccountType {
  standard,
  premium,
  vip,
}

extension AccountTypeExtension on AccountType {
  String get displayName {
    switch (this) {
      case AccountType.standard:
        return 'Standard';
      case AccountType.premium:
        return 'Premium';
      case AccountType.vip:
        return 'VIP';
    }
  }

  static AccountType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'standard':
        return AccountType.standard;
      case 'premium':
        return AccountType.premium;
      case 'vip':
        return AccountType.vip;
      default:
        throw ArgumentError('Invalid account type: $value');
    }
  }
}
