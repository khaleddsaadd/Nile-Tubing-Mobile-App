class Paymentmodel {
  final String Username;
  final String Userphone;
  final int Useremail;

  Paymentmodel({
    required this.Username,
    required this.Userphone,
    required this.Useremail,
  });
}

enum genders { male, female }
enum methods { cach, vodafone }
