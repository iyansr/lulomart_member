class Generasi3 {
  String memberId;
  String memberName;
  String memberAddress;
  String memberCity;
  String memberSex;

  Generasi3({
    this.memberId,
    this.memberName,
    this.memberAddress,
    this.memberCity,
    this.memberSex,
  });

  factory Generasi3.fromJson(Map<String, dynamic> json) {
    return new Generasi3(
      memberId: json['member_id'],
      memberName: json['member_name'],
      memberAddress: json['member_address'],
      memberCity: json['member_city'],
      memberSex: json['member_sex'],
    );
  }
}
