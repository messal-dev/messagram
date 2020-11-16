class Contact {
  final String name;
  final String replier;
  final String reply;
  final String imgUrl;
  final DateTime dateTime;
  final int countUnread;
  final bool isStory;
  final bool isViewed;

  Contact(this.name, this.replier, this.reply, this.imgUrl, this.dateTime, this.countUnread, this.isStory, this.isViewed);
}

final List<Contact> contacts = [
  Contact('Straw Hat', 'Sanji', 'Where the baka Mossjuro?', 'assets/straw-hat.jpeg', DateTime.now(), 13, true, true),
  Contact('Monkey D Luffy', 'You', 'Watashi wa kaizoku-ō ni narimasu', 'assets/luffy.jpg', DateTime.now(), 0, true, false),
  Contact('Akatsuki', 'Zoro', 'I got lost again.', 'assets/akatsuki.png', DateTime.now(), 122, false, true),
  Contact('Boa Hancock', 'You', 'Will you marry me?', 'assets/boa-hancock.jpg', DateTime.now(), 0, true, true),
  Contact('Charlotte Katakuri', 'Charlotte Katakuri', 'You never had a chance.', 'assets/katakuri.jpg', DateTime.now(), 1, true, false),
  Contact('Doffy', 'Doffy', 'Shihahahahahahah', 'assets/doffy.jpg', DateTime.now(), 1, false, true),
  Contact('Nico Robin', 'You', 'Do you love me?', 'assets/robin.jpg', DateTime.now(), 0, false, true),
  Contact('Konoha', 'Naruto', 'I miss Sasuke so much.', 'assets/konoha.jpg', DateTime.now(), 1, false, true),
  Contact('Hatake Kakashi', 'Hatake Kakashi', 'I got lost on the road of life.', 'assets/kakashi.jpg', DateTime.now(), 1, false, true),
  Contact('Nara Shikamaru', 'You', 'What\'s a drug?', 'assets/shikamaru.jpg', DateTime.now(), 0, true, false),
  Contact('Vinsmoke Sanji', 'Vinsmoke Sanji', 'A man forgives a woman\'s lies', 'assets/sanji.jpg', DateTime.now(), 1, true, true),
  Contact('Might Guy', 'You', 'Work hard can beat talen right?', 'assets/guy.jpg', DateTime.now(), 0, true, false),
  Contact('Shanks', 'Shanks', 'Good Job', 'assets/shanks.jpg', DateTime.now(), 1, false, true),
  Contact('Marine Headquarter', 'Akainu', 'I love you senpai Garp-san. <3', 'assets/marine.jpg', DateTime.now(), 1, true, true),
  Contact('Franky', 'Franky', 'Superrrrrrrr', 'assets/franky.png', DateTime.now(), 1, true, true),
];