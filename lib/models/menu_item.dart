class MenuItem {
  final String? icon;
  final String? text;
  final String? page;
  final String? section;

  MenuItem({this.icon, this.text, this.page, this.section});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      icon: json['icon'],
      text: json['text'],
      page: json['page'],
      section: json['section'],
    );
  }
}
