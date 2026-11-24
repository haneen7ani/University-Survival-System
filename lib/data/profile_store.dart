import 'dart:typed_data';

import 'package:flutter/foundation.dart';

enum Gender { male, female }

/// In-memory profile shared by the whole app.
/// Later this will be loaded from and saved to the backend (and local storage).
class ProfileStore extends ChangeNotifier {
  ProfileStore._();

  static final ProfileStore instance = ProfileStore._();

  String name = '';
  Gender? gender;

  /// Bytes of the chosen profile photo, or null to show the gender icon.
  Uint8List? photo;

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setGender(Gender value) {
    gender = value;
    notifyListeners();
  }

  void setPhoto(Uint8List? value) {
    photo = value;
    notifyListeners();
  }
}
