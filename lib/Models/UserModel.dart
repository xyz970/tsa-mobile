class UserModel{
  final String name;
  final String message;
  final String time;
  final String profileUrl;

UserModel({required this.name, required this.message,required this.time,required this.profileUrl});
}
final List<UserModel>items=[
  UserModel(name: "Ayang<3", message: "Love u", time: "14:50", profileUrl: ""),
  UserModel(name: "Rayhan", message: "Oke bro", time: "13:00", profileUrl: ""),
  UserModel(name: "Akbar", message: "Siap bos", time: "13:00", profileUrl: ""),
];