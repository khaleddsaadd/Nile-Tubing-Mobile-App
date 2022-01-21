class Events {
  final String? EventName;
  final String? EventID;
  final String? EventDescription;
  final String? EventType;
  final DateTime? EventStart;
  final DateTime? EventEnd;
  final String? EventPrice;

  Events(
      {this.EventName,
      this.EventID,
      this.EventDescription,
      this.EventType,
      this.EventStart,
      this.EventEnd,
      this.EventPrice});
}