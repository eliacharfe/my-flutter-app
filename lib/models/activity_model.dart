class ActivityModel {
  String id;
  String title;
  String description;
  String authorName;
  String date;
  String? startTime;
  String? endTime;
  String? location;
  String type;
  String? outreachType;
  String? completionStatus;
  String? badgeStatus;
  String? outreachDateTime;
  String? associateId;

  ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.authorName,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.location,
    required this.type,
    required this.outreachType,
    this.associateId,
    this.badgeStatus,
    this.completionStatus,
    this.outreachDateTime,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json['itemId'] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        authorName: json["associateName"] ?? '',
        date: json["eventDate"] ?? '',
        startTime: json["startTime"] ?? '',
        endTime: json["endTime"] ?? '',
        location: json["storeName"] ?? '',
        type: json["typeName"] ?? '',
        outreachType: json["touchpointType"] ?? '',
        completionStatus: json["completionStatus"] ?? '',
        badgeStatus: json["badgeStatus"] ?? '',
        associateId: json["associateId"] ?? '',
      );

  static getMockDataOutreaches({String? date}) => ActivityModel(
        id: '1331993',
        title: 'Send Email',
        description: 'Sent by email',
        authorName: 'Daniel Radcliffe',
        date: date ?? '2025-03-13',
        startTime: '',
        endTime: '',
        type: 'outreaches',
        outreachType: 'Email',
        badgeStatus: "Manual record",
      );

  static getMockDataEvents({String? date}) => ActivityModel(
      id: '932923',
      title: 'Gala Event',
      description: 'need to invite all relevant partners',
      authorName: 'Eliachar Feig',
      date: date ?? '2025-03-13',
      startTime: '',
      endTime: '',
      type: 'events',
      outreachType: '',
      associateId: '456');

  static getMockDataTransaction({String? date}) => ActivityModel(
        id: '483922',
        title: 'Chanel, 31 RUE CAMBON',
        description: 'Purchase online',
        authorName: 'John Smith',
        date: date ?? '2025-03-13',
        startTime: '',
        endTime: '',
        type: 'transaction',
        outreachType: '',
      );
}
