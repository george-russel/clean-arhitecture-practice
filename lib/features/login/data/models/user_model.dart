// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:clean_architecture_practice/features/login/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  UserModel({
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
  }) : super(
            id: id ?? '',
            name: name ?? '',
            email: email ?? '',
            phone: phone ?? '',
            profileImg: profileImg ?? '',
            state: state ?? '',
            city: city ?? '',
            address: address ?? '',
            isProfileCompleted: isProfileCompleted ?? false,
            isSubscriptionPaid: isSubscriptionPaid ?? false,
            isRegistrationQuestionCompleted:
                isRegistrationQuestionCompleted ?? false,
            currentSubscriptionPlan: currentSubscriptionPlan ?? '');

  @override
  UserModel copyWith({
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
      UserModel(
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profileImg: json["profile_img"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        isProfileCompleted: json["is_profile_completed"],
        isSubscriptionPaid: json["is_subscription_paid"],
        isRegistrationQuestionCompleted:
            json["is_registration_question_completed"],
        currentSubscriptionPlan: json["current_subscription_plan"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "profile_img": profileImg,
        "state": state,
        "city": city,
        "address": address,
        "is_profile_completed": isProfileCompleted,
        "is_subscription_paid": isSubscriptionPaid,
        "is_registration_question_completed": isRegistrationQuestionCompleted,
        "current_subscription_plan": currentSubscriptionPlan,
      };
}

// import 'package:clean_architecture_practice/features/login/domain/entities/user_entity.dart';
//
// class UserModel extends UserEntity {
//   UserModel({
//     String? id,
//     String? name,
//     String? email,
//     String? phone,
//     String? profileImg,
//     String? state,
//     String? city,
//     String? address,
//     bool? isProfileCompleted,
//     bool? isSubscriptionPaid,
//     bool? isRegistrationQuestionCompleted,
//     String? currentSubscriptionPlan,
//   }) : super(
//             id: id ?? '',
//             name: name ?? '',
//             email: email ?? '',
//             phone: phone ?? '',
//             profileImg: profileImg ?? '',
//             state: state ?? '',
//             city: city ?? '',
//             address: address ?? '',
//             isProfileCompleted: isProfileCompleted ?? false,
//             isSubscriptionPaid: isSubscriptionPaid ?? false,
//             isRegistrationQuestionCompleted:
//                 isRegistrationQuestionCompleted ?? false,
//             currentSubscriptionPlan: currentSubscriptionPlan ?? '');
//
//   @override
//   UserModel copyWith({
//     String? id,
//     String? name,
//     String? email,
//     String? phone,
//     String? profileImg,
//     String? state,
//     String? city,
//     String? address,
//     bool? isProfileCompleted,
//     bool? isSubscriptionPaid,
//     bool? isRegistrationQuestionCompleted,
//     String? currentSubscriptionPlan,
//   }) =>
//       UserModel(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         email: email ?? this.email,
//         phone: phone ?? this.phone,
//         profileImg: profileImg ?? this.profileImg,
//         state: state ?? this.state,
//         city: city ?? this.city,
//         address: address ?? this.address,
//         isProfileCompleted: isProfileCompleted ?? this.isProfileCompleted,
//         isSubscriptionPaid: isSubscriptionPaid ?? this.isSubscriptionPaid,
//         isRegistrationQuestionCompleted: isRegistrationQuestionCompleted ??
//             this.isRegistrationQuestionCompleted,
//         currentSubscriptionPlan:
//             currentSubscriptionPlan ?? this.currentSubscriptionPlan,
//       );
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json['id'] as String?,
//         name: json['name'] as String?,
//         email: json['email'] as String?,
//         phone: json['phone'] as String?,
//         profileImg: json['profileImg'] as String?,
//         state: json['state'] as String?,
//         city: json['city'] as String?,
//         address: json['address'] as String?,
//         isProfileCompleted: json['isProfileCompleted'] as bool?,
//         isSubscriptionPaid: json['isSubscriptionPaid'] as bool?,
//         isRegistrationQuestionCompleted:
//             json['isRegistrationQuestionCompleted'] as bool?,
//         currentSubscriptionPlan: json['currentSubscriptionPlan'] as String?,
//       );
// }
