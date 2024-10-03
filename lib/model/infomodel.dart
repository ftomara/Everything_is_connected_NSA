class Infomodel {
  String? imagepath = '';
  // String? info = '';
  List<String>? info = [];
  // List<String>? images=[];
  String? name = '';
  Infomodel({this.imagepath, this.info, this.name}) {
    info ??= [];
  }
}
