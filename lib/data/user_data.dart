class Profile {
  String name;
  String bio;
  String image;
  int points;

  Profile({
    required this.name,
    required this.bio,
    required this.image,
    this.points = 0,
  });
}


List<Profile> profiles = [
  Profile(name: '기본', bio: '', image: 'assets/images/profile1.jpg'),
  Profile(name: '프로필1', bio: '', image: 'assets/images/profile2.jpg'),
  Profile(name: '프로필2', bio: '', image: 'assets/images/profile3.jpg'),
  Profile(name: '프로필3', bio: '', image: 'assets/images/profile4.jpg'),
];

Profile currentUser = Profile(
  name: 'NAME',
  bio: 'bio',
  image: 'assets/images/profile3.jpg',
  points: 0,
);
