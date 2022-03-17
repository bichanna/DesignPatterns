/*
  Written by Nobuharu Shimazu
  Date: 2022/3/16

  Pattern: Decorator
*/

void main() {
  Beverage bigPlainEspresso = Espresso();
  bigPlainEspresso.setSize(Size.VENTI); // does not change the price
  print(bigPlainEspresso.getDescription());
  print(bigPlainEspresso.cost().toStringAsFixed(2));

  Beverage smallDecafTripleWhip = Decaf();
  for (int i = 0; i < 3; i++) smallDecafTripleWhip = Whip(smallDecafTripleWhip);
  print(smallDecafTripleWhip.getDescription());
  print(smallDecafTripleWhip.cost().toStringAsFixed(2));

  Beverage mediumEspressoMochaWhip = Espresso();
  mediumEspressoMochaWhip.setSize(Size.GRANDE);
  mediumEspressoMochaWhip = Mocha(mediumEspressoMochaWhip);
  mediumEspressoMochaWhip = Whip(mediumEspressoMochaWhip);
  print(mediumEspressoMochaWhip.getDescription());
  print(mediumEspressoMochaWhip.cost().toStringAsFixed(2));
}

/*
  The Size enum
*/
enum Size {
  TALL,   // small
  GRANDE, // medium
  VENTI,  // large
}

/*
  The class that all begerages extend
*/
abstract class Beverage {
  String description = "??";
  Size size = Size.TALL;

  String getDescription() => description;

  void setSize(Size size) => this.size = size;
  Size getSize() => size;

  double cost();
}

class Espresso extends Beverage {
  Espresso() {
    description = "Expresso";
  }

  @override
  double cost() => 2.99;
}

class Decaf extends Beverage {
  Decaf() {
    description = "Decaf";
  }

  @override
  double cost() => 3.50;
}

/*
  The abstract class that all condiments extend
*/
abstract class CondimentDecorator extends Beverage {
  late Beverage beverage;

  String getDescription();
}

class Mocha extends CondimentDecorator {
  Mocha(Beverage beverage) {
    this.beverage = beverage;
  }
  
  @override
  String getDescription() => "${beverage.getDescription()}, Mocha";

  @override
  double cost() {
    double cost = 0.35;
    switch (beverage.getSize()) {
      case Size.TALL:
        cost -= 0.10;
        break;
      case Size.GRANDE:
        break;
      case Size.VENTI:
        cost += 0.20;
        break;
    }
    return beverage.cost() + cost;
  }
}

class Whip extends CondimentDecorator {
  Whip(Beverage beverage) {
    this.beverage = beverage;
  }

  @override
  String getDescription() => "${beverage.getDescription()}, Whip";

  @override
  double cost() {
    double cost = 0.30;
    switch (beverage.getSize()) {
      case Size.TALL:
        cost -= 0.10;
        break;
      case Size.GRANDE:
        break;
      case Size.VENTI:
        cost += 0.15;
        break;
    }
    return beverage.cost() + cost;
  }
}