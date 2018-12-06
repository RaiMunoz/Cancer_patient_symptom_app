
class entry_submit {
  String email_name;
  entry_submit(this.email_name);


  toJson()
  {
    return {
      "email": email_name
    };
  }
}

