class ridesmodel {
  final String? rideName;
  final String? rideType;
  final String? rideCapacity;
  final DateTime? rideStart;
  final DateTime? rideEnd;
  final String? rideDescription;
  final int? ridePrice;
  final String? rideImage;
  final int? rideID;

  ridesmodel(
      {this.rideID,
      this.rideName,
      this.rideImage,
      this.rideType,
      this.rideCapacity,
      this.rideStart,
      this.rideEnd,
      this.rideDescription,
      this.ridePrice});
}
