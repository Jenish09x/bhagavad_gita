class HomeModel
{
  final dynamic id;
  final String title,url,sholka,meaning,english;

  HomeModel({required this.id, required this.title, required this.sholka, required this.meaning, required this.english,required this.url});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      title: m1['title'],
      url: m1["url"],
      sholka: m1["sholka"],
      meaning: m1['meaning'],
      english: m1['english'],
    );
  }
}