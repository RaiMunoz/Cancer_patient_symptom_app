class nameEntry{
  String name;
  String email;

  nameEntry(this.name,this.email);

  toJson()
  {
    return {
      "name": name,
      "email": email
    };
  }
}
