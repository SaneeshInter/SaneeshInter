

bool validEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool validPassword(String password) {
  return password.length > 6;
}

bool validJob(String jobtitle) {
  return jobtitle.length > 3;
}

bool validLocation(String location) {
  return location.length > 3;
}

bool validDescription(String description) {
  return description.length > 3;
}

bool validDate(String date) {
  return date.length!=0;
}

bool validTimefrom(String dateFrom){
  return dateFrom.length!=0;
}





