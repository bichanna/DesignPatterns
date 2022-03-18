/**
 * Written by Nobuharu Shimazu
 * Date: 2022/3/17
 * 
 * Pattern: Abstract Factory (franchising Noby's Pizzeria across America!)
 * (BTW, I just watched the McDonald's movie, The Founder)
 */

void main() {
  NYNobysPizzeria nyNobysPizzeria = NYNobysPizzeria();
  nyNobysPizzeria.orderPizza("cheese");
  nyNobysPizzeria.orderPizza("pepperoni");
  
  
  print("\n");

  ChicagoNobysPizzeria chicagoNobysPizzeria = ChicagoNobysPizzeria();
  chicagoNobysPizzeria.orderPizza("pepperoni");
  chicagoNobysPizzeria.orderPizza("cheese");
}

/**
 * The PizzaIngredientFactory interface that every franchises have to implement
 */
abstract class PizzaIngredientFactory {
  Dough createDough();
  Sauce createSauce();
  Cheese createCheese();
  Pepperoni createPepperoni();
}

class NYPizzaIngredientFactory implements PizzaIngredientFactory {
  @override
  Dough createDough() => ThinCrustDough();
  
  @override
  Sauce createSauce() => MarinaraSause();

  @override
  Cheese createCheese() => ReggianoCheese();

  Pepperoni createPepperoni() => SlicedPepperoni();
}

class ChicagoPizzaIngredientFactory implements PizzaIngredientFactory {
  @override
  Dough createDough() => ThickCrustDough();

  @override
  Sauce createSauce() => TomatoSauce();

  @override
  Cheese createCheese() => MozzarellaCheese();

  @override
  Pepperoni createPepperoni() => SlicedPepperoni();
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
    Pizza? pizza = null;
    PizzaIngredientFactory ingredientFactory = NYPizzaIngredientFactory();

    if (pizzaType.toLowerCase() == "cheese") {
      pizza = CheesePizza(ingredientFactory);
      pizza.setName("New York Style Cheese Pizza");
    } else if (pizzaType.toLowerCase() == "pepperoni") {
      pizza = PepperoniPizza(ingredientFactory);
      pizza.setName("New York Style Pepperoni Pizza");
    }

    if (pizza != null) return pizza;

    throw BadPizzaTypeException();
  }
}

/**
 * Chicago Noby's Pizzeria
 */
class ChicagoNobysPizzeria extends NobysPizzeria {
  @override
  Pizza createPizza(String pizzaType) {
    Pizza? pizza = null;
    PizzaIngredientFactory ingredientFactory = ChicagoPizzaIngredientFactory();

    if (pizzaType.toLowerCase() == "cheese") {
      pizza = CheesePizza(ingredientFactory);
      pizza.setName("Chicago Style Cheese Pizza");
    } else if (pizzaType.toLowerCase() == "pepperoni") {
      pizza = PepperoniPizza(ingredientFactory);
      pizza.setName("Chicago Style Pepperoni Pizza");
    }

    if (pizza != null) return pizza;
    
    throw BadPizzaTypeException();
  }
}

/**
 * The Pizza class that all types of pizzas inherit
 */
abstract class Pizza {
  late final String name;

  late Dough dough;
  late Sauce sauce;
  late Cheese cheese;
  late Pepperoni pepperoni;
  
  void prepare();

  void bake() => print("Baking for 20 minutes at 345");

  void cut() => print("Cutting ${getName()}");

  void box() => print("Placing ${getName()} in a box");

  void setName(String name) => this.name = name;

  String getName() => name;
}

class CheesePizza extends Pizza {
  final PizzaIngredientFactory ingredientFactory;

  CheesePizza(this.ingredientFactory);
  
  @override
  void prepare() {
    print("Preparing ${getName()}");
    dough = ingredientFactory.createDough();
    sauce = ingredientFactory.createSauce();
    cheese = ingredientFactory.createCheese();
  }
}

class PepperoniPizza extends Pizza {
  final PizzaIngredientFactory ingredientFactory;

  PepperoniPizza(this.ingredientFactory);

  @override
  void prepare() {
    print("Preparing ${getName()}");
    dough = ingredientFactory.createDough();
    sauce = ingredientFactory.createSauce();
    cheese = ingredientFactory.createCheese();
    pepperoni = ingredientFactory.createPepperoni();
  }
}

// ==================== INGREDIENTS =======================

abstract class Dough {}
class ThinCrustDough extends Dough {}
class ThickCrustDough extends Dough {}

abstract class Sauce {}
class MarinaraSause extends Sauce {}
class TomatoSauce extends Sauce {}

abstract class Cheese {}
class ReggianoCheese extends Cheese {}
class MozzarellaCheese extends Cheese {}

abstract class Pepperoni {}
class SlicedPepperoni extends Pepperoni {}


// ==================== EXCEPTION(S) =======================

class BadPizzaTypeException implements Exception {
  late String cause;
  
  BadPizzaTypeException({String cause = "That pizza type does not exist!"}) {
    this.cause = cause;
  }
}