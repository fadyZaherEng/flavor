enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Flavor Dev';
      case Flavor.production:
        return 'Flavor Prod';
      default:
        return 'title';
    }
  }
  static String get getBodyTitle{
  switch (appFlavor) {
  case Flavor.development:
  return 'Flavor Dev Body';
  case Flavor.production:
  return 'Flavor Prod Body';
  default:
  return 'title';
  }
}

}
