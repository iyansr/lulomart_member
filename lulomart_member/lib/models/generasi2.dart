class Generasi2 {
  String memberId;
  String memberName;
  String memberAddress;
  String memberCity;
  String memberSex;
  String registerDate;

  Generasi2({
    this.memberId,
    this.memberName,
    this.memberAddress,
    this.memberCity,
    this.memberSex,
    this.registerDate,
  });

  factory Generasi2.fromJson(Map<String, dynamic> json) {
    return new Generasi2(
        memberId: json['member_id'],
        memberName: json['member_name'],
        memberAddress: json['member_address'],
        memberCity: json['member_city'],
        memberSex: json['member_sex'],
        registerDate: json['member_registrationdate']);
  }
}
