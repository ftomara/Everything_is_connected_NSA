class Infomodel {
  String? imagepath = '';
  // String? info = '';
  List<String>? info = [];
  bool ?isVideo;
  // List<String>? images=[];
  String? name = '';
  Infomodel({this.imagepath, this.info, this.name,this.isVideo}) {
    info ??= [];
  }
}
