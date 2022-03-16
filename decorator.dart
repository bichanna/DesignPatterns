/*
  Written by Nobuharu Shimazu
  Date: 2022/3/16

  Pattern: Decorator
*/

void main() {
  Beverage plainEspresso = Espresso();
  print(plainEspresso.getDescription());
  print(plainEspresso.cost().toStringAsFixed(2));

  Beverage decafTripleWhip = Decaf();
  for (int i = 0; i < 3; i++) decafTripleWhip = Whip(decafTripleWhip);
  print(decafTripleWhip.getDescription());
  print(decafTripleWhip.cost().toStringAsFixed(2));

  Beverage espressoMochaWhip = Espresso();
  espressoMochaWhip = Mocha(espressoMochaWhip);
  espressoMochaWhip = Whip(espressoMochaWhip);
  print(espressoMochaWhip.getDescription());
  print(espressoMochaWhip.cost().toStringAsFixed(2));
}

/*
  The class that all begerages extend
*/
abstract class Beverage {
  String description = "??";

  String getDescription() => description;

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
  double cost() => beverage.cost() + 0.30;
}

class Whip extends CondimentDecorator {
  Whip(Beverage beverage) {
    this.beverage = beverage;
  }

  @override
  String getDescription() => "${beverage.getDescription()}, Whip";

  @override
  double cost() => beverage.cost() + 0.30;
}