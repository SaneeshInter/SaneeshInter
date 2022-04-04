class UtilityResop {
  UtilResponse? response;

  UtilityResop({this.response});

  UtilityResop.fromJson(Map<String, dynamic> json) {
    response = json['Response'] != null
        ? new UtilResponse.fromJson(json['Response'])
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

class UtilResponse {
  Data? data;
  Status? status;

  UtilResponse({this.data, this.status});

  UtilResponse.fromJson(Map<String, dynamic> json) {
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
  List<GenderList>? genderList;
  List<CountryList>? countryList;
  List<UserTypeList>? userTypeList;
  List<VisaTypeList>? visaTypeList;
  List<LoctionsList>? loctionsList;

  Data(
      {this.genderList,
      this.countryList,
      this.userTypeList,
      this.visaTypeList,
      this.loctionsList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['gender_list'] != null) {
      genderList = <GenderList>[];
      json['gender_list'].forEach((v) {
        genderList!.add(new GenderList.fromJson(v));
      });
    }
    if (json['country_list'] != null) {
      countryList = <CountryList>[];
      json['country_list'].forEach((v) {
        countryList!.add(new CountryList.fromJson(v));
      });
    }
    if (json['user_type_list'] != null) {
      userTypeList = <UserTypeList>[];
      json['user_type_list'].forEach((v) {
        userTypeList!.add(new UserTypeList.fromJson(v));
      });
    }
    if (json['visa_type_list'] != null) {
      visaTypeList = <VisaTypeList>[];
      json['visa_type_list'].forEach((v) {
        visaTypeList!.add(new VisaTypeList.fromJson(v));
      });
    }
    if (json['loctions_list'] != null) {
      loctionsList = <LoctionsList>[];
      json['loctions_list'].forEach((v) {
        loctionsList!.add(new LoctionsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genderList != null) {
      data['gender_list'] = this.genderList!.map((v) => v.toJson()).toList();
    }
    if (this.countryList != null) {
      data['country_list'] = this.countryList!.map((v) => v.toJson()).toList();
    }
    if (this.userTypeList != null) {
      data['user_type_list'] =
          this.userTypeList!.map((v) => v.toJson()).toList();
    }
    if (this.visaTypeList != null) {
      data['visa_type_list'] =
          this.visaTypeList!.map((v) => v.toJson()).toList();
    }
    if (this.loctionsList != null) {
      data['loctions_list'] =
          this.loctionsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GenderList {
  int? rowId;
  String? gender;

  GenderList({this.rowId, this.gender});

  GenderList.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['gender'] = this.gender;
    return data;
  }
}

class VisaTypeList {
  int? rowId;
  String? type;

  VisaTypeList({this.rowId, this.type});

  VisaTypeList.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['type'] = this.type;
    return data;
  }
}

class CountryList {
  int? rowId;
  String? countryName;

  CountryList({this.rowId, this.countryName});

  CountryList.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['country_name'] = this.countryName;
    return data;
  }
}

class UserTypeList {
  int? rowId;
  String? type;

  UserTypeList({this.rowId, this.type});

  UserTypeList.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['type'] = this.type;
    return data;
  }
}

class LoctionsList {
  int? rowId;
  String? location;

  LoctionsList({this.rowId, this.location});

  LoctionsList.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['location'] = this.location;
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
