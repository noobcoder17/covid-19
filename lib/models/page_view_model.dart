class SubContent {
  final String title;
  final String details;
  final String imagePath;

  SubContent({this.title, this.details, this.imagePath});
}

class PageContent {
  final String pageHeading;
  final String heading1;
  final String heading2;
  final String heading3;
  final List<SubContent> content;

  PageContent({this.pageHeading, this.heading1, this.heading2, this.heading3, this.content});
}