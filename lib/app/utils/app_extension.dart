extension TitleExtension on String {
  String toTileUperCase() {
    return this[0].toUpperCase() + substring(1);
  }
}
