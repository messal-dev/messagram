class RoomModel {
  final String name;
  final String imgUrl;
  final bool isActive;

  RoomModel(this.name, this.imgUrl, this.isActive);
}

final List<RoomModel> rooms = [
  RoomModel('Siv D Messal', 'assets/sakuna.jpg', true),
  RoomModel('Monkey D Luffy', 'assets/luffy.jpg', true),
  RoomModel('Boa Hancock', 'assets/boa-hancock.jpg', true),
  RoomModel('Roronoa Zoro', 'assets/zoro.jpg', true),
  RoomModel('Vinsmoke Sanji', 'assets/sanji.jpg', true),
  RoomModel('Charlotte Katakuri', 'assets/katakuri.jpg', true),
  RoomModel('Hatake Kakashi', 'assets/kakashi.jpg', true),
  RoomModel('Might Guy', 'assets/guy.jpg', true),
  RoomModel('Captain Yamato', 'assets/yamato.jpg', true),
  RoomModel('Nara Shikamaru', 'assets/shikamaru.jpg', true),
  RoomModel('Brook', 'assets/brook.jpg', true),
];
