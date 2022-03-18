/**
 * Written by Nobuharu Shimazu
 * Date: 2022/3/17
 * 
 * Pattern: Factory (franchising Noby's Pizzeria across America!)
 * (BTW, I just watched the McDonald's movie, The Founder)
 */

void main() {
  NYNobysPizzeria nyNobysPizzeria = NYNobysPizzeria();
  for (int i = 0; i < 3; i++) nyNobysPizzeria.orderPizza("cheese");
  nyNobysPizzeria.orderPizza("pepperoni");
  
  
  print("\n");

  ChicagoNobysPizzeria chicagoNobysPizzeria = ChicagoNobysPizzeria();
  chicagoNobysPizzeria.orderPizza("pepperoni");
  chicagoNobysPizzeria.orderPizza("cheese");
}

/**
 * abstract (archetypal) Noby's Pizzeria
 */
abstract class NobysPizzeria {

  Pizza orderPizza(String type) {
    Pizza pizza = createPizza(type);
    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
  }

  Pizza createPizza(String pizzaType);
}

/**
 * New York Noby's Pizzeria
 */
class NYNobysPizzeria extends NobysPizzeria {
  @override
  Pizza createPizza(String pizzaType) {
    if (pizzaType.toLowerCase() == "cheese") return NYCheesePizza();
    if (pizzaType.toLowerCase() == "pepperoni") return NYPepperoniPizza();
    return Pizza();
  }
}

/**
 * Chicago Noby's Pizzeria
 */
class ChicagoNobysPizzeria extends NobysPizzeria {
  @override
  Pizza createPizza(String pizzaType) {
    if (pizzaType.toLowerCase() == "cheese") return ChicagoCheesePizza();
    if (pizzaType.toLowerCase() == "pepperoni") return ChicagoPepperoniPizza();
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

class NYCheesePizza extends Pizza {
  @override
  void prepare() => print("Preparing an NY-style cheese pizza.");

  @override
  void bake() => print("Baking an NY-style pizza.");

  @override
  void cut() => print("Cutting an NY-style pizza");

  @override
  void box() => print("Boxing an NY-style pizza");

  @override
  String toString() => "NY-style cheese pizza";
}

class NYPepperoniPizza extends Pizza {
  @override
  void prepare() => print("Preparing an NY-style pepperoni pizza.");

  @override
  void bake() => print("Baking an NY-style pepperoni pizza.");

  @override
  void cut() => print("Cutting an NY-style pepperoni pizza");

  @override
  void box() => print("Boxing an NY-style pepperoni pizza");

  @override
  String toString() => "NY-style pepperoni pizza";
}

class ChicagoCheesePizza extends Pizza {
  @override
  void prepare() => print("Preparing a Chicago-style cheese pizza.");

  @override
  void bake() => print("Baking a Chicago-style pizza.");

  @override
  void cut() => print("Cutting a Chicago-style pizza");

  @override
  void box() => print("Boxing a Chicago-style pizza");

  @override
  String toString() => "Chicago-style cheese pizza";
}

class ChicagoPepperoniPizza extends Pizza {
  @override
  void prepare() => print("Preparing a Chicago-style pepperoni pizza.");

  @override
  void bake() => print("Baking a Chicago-style pepperoni pizza.");

  @override
  void cut() => print("Cutting a Chicago-style pepperoni pizza");

  @override
  void box() => print("Boxing a Chicago-style pepperoni pizza");

  @override
  String toString() => "Chicago-style pepperoni pizza";
}
