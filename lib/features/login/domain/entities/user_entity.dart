class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profileImg;
  final String state;
  final String city;
  final String address;
  final bool isProfileCompleted;
  final bool isSubscriptionPaid;
  final bool isRegistrationQuestionCompleted;
  final String currentSubscriptionPlan;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImg,
    required this.state,
    required this.city,
    required this.address,
    required this.isProfileCompleted,
    required this.isSubscriptionPaid,
    required this.isRegistrationQuestionCompleted,
    required this.currentSubscriptionPlan,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profileImg,
    String? state,
    String? city,
    String? address,
    bool? isProfileCompleted,
    bool? isSubscriptionPaid,
    bool? isRegistrationQuestionCompleted,
    String? currentSubscriptionPlan,
  }) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        profileImg: profileImg ?? this.profileImg,
        state: state ?? this.state,
        city: city ?? this.city,
        address: address ?? this.address,
        isProfileCompleted: isProfileCompleted ?? this.isProfileCompleted,
        isSubscriptionPaid: isSubscriptionPaid ?? this.isSubscriptionPaid,
        isRegistrationQuestionCompleted: isRegistrationQuestionCompleted ??
            this.isRegistrationQuestionCompleted,
        currentSubscriptionPlan:
            currentSubscriptionPlan ?? this.currentSubscriptionPlan,
      );
}
