class checkuserModel {
  var message;
  var phone, name, email;
  checkuserModel(this.message, this.email, this.name, this.phone);

  checkuserModel.fromJson(json) {
    message = json["message"];
    email = json["email"];
    name = json["name"];
    phone = json["phone"];
  }
}
