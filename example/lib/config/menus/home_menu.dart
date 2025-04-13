class HomeMenu {
  final String title;
  final String image;
  final String route;

  HomeMenu({required this.title, required this.image, required this.route});
}

final List<HomeMenu> homeMenu = [
  HomeMenu(title: 'Atoms', image: 'assets/images/atoms.png', route: '/atoms'),
  HomeMenu(
    title: 'molecules',
    image: 'assets/images/molecules.png',
    route: '/molecules',
  ),
  HomeMenu(
    title: 'organisms',
    image: 'assets/images/organisms.png',
    route: '/organisms',
  ),
  HomeMenu(
    title: 'templates',
    image: 'assets/images/templates.png',
    route: '/templates',
  ),
  HomeMenu(title: 'pages', image: 'assets/images/pages.png', route: '/pages'),
];
