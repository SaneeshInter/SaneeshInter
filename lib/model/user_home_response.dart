class UserHomeResponse {
  Response? response;

  UserHomeResponse({this.response});

  UserHomeResponse.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['Response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  Data? data;
  Status? status;

  Response({this.data, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Data {
  List<ImportantUpdates>? importantUpdates;
  List<LatestShift>? latestShift;

  Data({this.importantUpdates, this.latestShift});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['important_updates'] != null) {
      importantUpdates = <ImportantUpdates>[];
      json['important_updates'].forEach((v) {
        importantUpdates!.add(new ImportantUpdates.fromJson(v));
      });
    }
    if (json['latest_shift'] != null) {
      latestShift = <LatestShift>[];
      json['latest_shift'].forEach((v) {
        latestShift!.add(new LatestShift.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.importantUpdates != null) {
      data['important_updates'] =
          this.importantUpdates!.map((v) => v.toJson()).toList();
    }
    if (this.latestShift != null) {
      data['latest_shift'] = this.latestShift!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImportantUpdates {
  String? title;
  String? date;
  String? description;

  ImportantUpdates({this.title, this.date, this.description});

  ImportantUpdates.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['description'] = this.description;
    return data;
  }
}

class LatestShift {
  int? rowId;
  String? type;
  String? userType;
  int? category;
  String? jobTitle;
  String? hospital;
  String? date;
  String? timeFrom;
  String? timeTo;
  String? jobDetails;
  Null? price;
  Null? allowances;
  String? createdDate;

  LatestShift(
      {this.rowId,
        this.type,
        this.userType,
        this.category,
        this.jobTitle,
        this.hospital,
        this.date,
        this.timeFrom,
        this.timeTo,
        this.jobDetails,
        this.price,
        this.allowances,
        this.createdDate});

  LatestShift.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    type = json['type'];
    userType = json['user_type'];
    category = json['category'];
    jobTitle = json['job_title'];
    hospital = json['hospital'];
    date = json['date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    jobDetails = json['job_details'];
    price = json['price'];
    allowances = json['allowances'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['type'] = this.type;
    data['user_type'] = this.userType;
    data['category'] = this.category;
    data['job_title'] = this.jobTitle;
    data['hospital'] = this.hospital;
    data['date'] = this.date;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['job_details'] = this.jobDetails;
    data['price'] = this.price;
    data['allowances'] = this.allowances;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class Status {
  int? count;
  int? statusCode;
  String? statusMessage;

  Status({this.count, this.statusCode, this.statusMessage});

  Status.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    return data;
  }
}

