import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Ballon Nike Professionnel',
      description:
          'Ce ballon Nike est conçu pour les matchs professionnels. Il offre une excellente stabilité de trajectoire, une surface texturée pour un meilleur contrôle, et une durabilité accrue pour une performance constante sur tout type de terrain.',
      price: 120000,
      category: 'Sport',
      imageUrl: 'assets/images/ballon.png',
      rating: 4.5,
    ),
    Product(
      id: '2',
      name: 'Baskette Montante Nike',
      description:
          'Chaussures montantes Nike pour les passionnés de basketball. Elles assurent un excellent maintien de la cheville, une semelle amortissante pour les sauts répétés, et un style moderne pour vos sessions sportives ou urbaines.',
      price: 20000,
      category: 'Sport',
      imageUrl: 'assets/images/basket.png',
      rating: 4.2,
    ),
    Product(
      id: '3',
      name: 'Gants de Boxe Professionnels',
      description:
          'Gants rembourrés pour les entraînements et compétitions de boxe. Conçus pour offrir une excellente protection des poignets, une prise en main confortable et une ventilation efficace pour éviter l’accumulation de transpiration.',
      price: 5000,
      category: 'Sport',
      imageUrl: 'assets/images/gants.png',
      rating: 4.2,
    ),
    Product(
      id: '4',
      name: 'Raquette de Ping-pong',
      description:
          'Raquette de ping-pong équilibrée, idéale pour les joueurs intermédiaires et avancés. Sa surface en caoutchouc offre un bon contrôle et un excellent effet lors des échanges rapides.',
      price: 7000,
      category: 'Sport',
      imageUrl: 'assets/images/pingpong.png',
      rating: 4.2,
    ),
    Product(
      id: '5',
      name: 'Sac Nike Original',
      description:
          'Sac à dos Nike élégant et spacieux, parfait pour le sport ou un usage quotidien. Conçu avec des matériaux résistants, il dispose de plusieurs compartiments pour une organisation optimale.',
      price: 6000,
      category: 'Sport',
      imageUrl: 'assets/images/sac.png',
      rating: 4.2,
    ),
    Product(
      id: '6',
      name: 'Clavier & Souris Sans Fil',
      description:
          'Ensemble clavier et souris sans fil ergonomiques, parfait pour un bureau moderne. Connexion stable, design compact, idéal pour une productivité fluide à la maison ou au travail.',
      price: 3000,
      category: 'Électronique',
      imageUrl: 'assets/images/clavier.png',
      rating: 4.2,
    ),
    Product(
      id: '7',
      name: 'Casque Audio AUX',
      description:
          'Casque audio filaire avec entrée AUX 3.5mm, conçu pour une qualité sonore claire, des basses profondes et un confort prolongé, parfait pour la musique, les appels et les jeux.',
      price: 5000,
      category: 'Électronique',
      imageUrl: 'assets/images/casque.png',
      rating: 4.2,
    ),
    Product(
      id: '8',
      name: 'Mac E-Book',
      description:
          'Ordinateur portable Apple MacBook dernière génération. Léger, rapide, doté d’un écran Retina, d’une autonomie longue durée et de performances idéales pour les professionnels comme les étudiants.',
      price: 220000,
      category: 'Électronique',
      imageUrl: 'assets/images/mac.png',
      rating: 4.2,
    ),
    Product(
      id: '9',
      name: 'PC Complet (Unité, Écran, Clavier, Souris)',
      description:
          'Pack complet prêt à l’emploi pour le travail ou les loisirs : unité centrale puissante, écran haute résolution, clavier et souris inclus. Idéal pour les tâches bureautiques, le streaming et le gaming léger.',
      price: 250000,
      category: 'Électronique',
      imageUrl: 'assets/images/desktop.png',
      rating: 4.2,
    ),
    Product(
      id: '10',
      name: 'Console PS4 - 1 To',
      description:
          'Console de jeu Sony PlayStation 4 avec 1 To de stockage. Profitez d’une vaste bibliothèque de jeux, de graphismes immersifs et d’une expérience fluide pour les gamers de tous niveaux.',
      price: 42000,
      category: 'Électronique',
      imageUrl: 'assets/images/ps4.png',
      rating: 4.2,
    ),
  ];

  double _minPrice = 0;
  double _maxPrice = 999999;
  String _selectedCategory = 'Tous';

  List<Product> get products {
    return _products.where((product) {
      final matchCategory =
          _selectedCategory == 'Tous' ||
          product.category.toLowerCase() == _selectedCategory.toLowerCase();
      final matchPrice =
          product.price >= _minPrice && product.price <= _maxPrice;
      return matchCategory && matchPrice;
    }).toList();
  }

  List<String> get categories {
    final allCategories = _products.map((p) => p.category).toSet().toList();
    return ['Tous', ...allCategories];
  }

  void setPriceFilter(double min, double max) {
    _minPrice = min;
    _maxPrice = max;
    notifyListeners();
  }

  void setCategoryFilter(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void resetFilters() {
    _minPrice = 0;
    _maxPrice = 999999;
    _selectedCategory = 'Tous';
    notifyListeners();
  }

  List<Product> get allProducts => _products;
}
