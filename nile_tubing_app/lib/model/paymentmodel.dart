import 'package:nile_tubing_app/model/enums.dart';

class Paymentmodel {
  final String Username;
  final String Userphone;
  final String Useremail;
  genders gender;
  methods method;

  Paymentmodel(
      {required this.Username,
      required this.Userphone,
      required this.Useremail,
      required this.gender,
      required this.method});
}

// enum genders { male, female }

