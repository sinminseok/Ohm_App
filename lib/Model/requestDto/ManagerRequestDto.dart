class ManagerRequestDto {
  String? name_;

  String? email_;

  String? password_;

  String? nickname_;

  String? profile_;

  String? oneline_introduce_;

  String? introduce_;

  int? age_;

  String? code_;

  String? get name => name_;
  String? get email => email_;
  String? get password => password_;
  String? get nickname => nickname_;
  String? get profile => profile_;
  String? get oneline_introduce => oneline_introduce_;
  String? get introduce => introduce_;
  int? get age => age_;
  String? get code => code_;




  ManagerRequestDto(
      {required this.name_,
      required this.email_,
      required this.password_,
      required this.nickname_,
      required this.profile_,
      required this.oneline_introduce_,
      required this.introduce_,
      required this.age_,
      required this.code_});
}
