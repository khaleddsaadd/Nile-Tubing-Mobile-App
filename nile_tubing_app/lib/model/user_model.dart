class Usermodel {
  final String ID;
  final String Firstname;
  final String Lastname;
  final String Email;
  final int Mobile;

  Usermodel(
    this.ID,
    this.Firstname,
    this.Lastname,
    this.Email,
    this.Mobile,
  );

  String getid() {
    return this.ID;
  }
}
