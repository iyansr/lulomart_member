class Generasi1 {
  String memberId;
  String memberName;
  String memberAddress;
  String memberCity;
  String memberSex;
  String registerDate;

  Generasi1({
    this.memberId,
    this.memberName,
    this.memberAddress,
    this.memberCity,
    this.memberSex,
    this.registerDate,
  });

  factory Generasi1.fromJson(Map<String, dynamic> json) {
    return new Generasi1(
      memberId: json['member_id'],
      memberName: json['member_name'],
      memberAddress: json['member_address'],
      memberCity: json['member_city'],
      memberSex: json['member_sex'],
      registerDate: json['member_registrationdate'],
    );
  }
}
