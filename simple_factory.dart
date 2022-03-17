/*
  Written by Nobuharu Shimazu
  Date: 2022/3/17

  Pattern: Simple Factory (not a pattern, actually)
*/

void main() {
  SimplePizzaFactory pizzaFactory = SimplePizzaFactory();
  NobysPizzeria nobysPizzeria = NobysPizzeria(pizzaFactory);

  nobysPizzeria.orderPizza("Margherita");
  nobysPizzeria.orderPizza("Cheese");
  nobysPizzeria.orderPizza("Pepperoni");
}

/**
 * Noby's Pizzeria
 */
class NobysPizzeria {
  final SimplePizzaFactory factory;

  NobysPizzeria(this.factory);

  Pizza orderPizza(String type) {
    Pizza pizza = factory.createPizza(type);
    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
  }
}

/*
  The factory where pizzas are created
*/
class SimplePizzaFactory {
  Pizza createPizza(String pizzaType) {
    if (pizzaType.toLowerCase() == "cheese") return CheesePizza();
    if (pizzaType.toLowerCase() == "pepperoni") return PepperoniPizza();
    if (pizzaType.toLowerCase() == "margherita") return MargheritaPizza();
    return Pizza();
  }
}

/**
 * The Pizza class that all types of pizzas inherit
 */
class Pizza {
  void prepare() => print("Preparing.");

  void bake() => print("Baking.");

  void cut() => print("Cutting.");

  void box() => print("Boxing");

  @override
  String toString() => "Pizza";
}

class CheesePizza extends Pizza {
  @override
  void prepare() => print("Preparing a cheese pizza.");

  @override
  void bake() => print("Baking a cheese pizza.");

  @override
  void cut() => print("Cutting a cheese pizza");

  @override
  void box() => print("Boxing a cheese pizza");

  @override
  String toString() => "Cheese pizza";
}

class PepperoniPizza extends Pizza {
  @override
  void prepare() => print("Preparing a pepperoni pizza.");

  @override
  void bake() => print("Baking a pepperoni pizza.");

  @override
  void cut() => print("Cutting a pepperoni pizza");

  @override
  void box() => print("Boxing a pepperoni pizza");

  @override
  String toString() => "Pepperoni pizza";
}

class MargheritaPizza extends Pizza {
  @override
  void prepare() => print("Preparing a Margherita.");

  @override
  void bake() => print("Baking a Margherita.");

  @override
  void cut() => print("Cutting a Margherita");

  @override
  void box() => print("Boxing a Margherita");

  @override
  String toString() => "Margherita";
}