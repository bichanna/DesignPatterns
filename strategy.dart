/*
  Written by Nobuharu Shimazu
  Date: 2022/3/16
  
  Pattern: Strategy
*/

void main() {
  Humanoid elfA = Elf();
  elfA.setWeapon(SwordBehavior());
  elfA.fight();

  Humanoid humanB = Human();
  humanB.setWeapon(KnifeBehavior());
  humanB.fight();

  Humanoid trollC = Troll();
  trollC.setWeapon(AxeBehavior());
  trollC.fight();
}

/*
  The interface that all weapon behavior classes implement
*/
abstract class WeaponBehavior {
  String useWeapon();
}

class SwordBehavior implements WeaponBehavior {
  @override
  String useWeapon() => "Swing, swing! Swinging a Sword!";
}

class AxeBehavior implements WeaponBehavior {
  @override
  String useWeapon() => "Chop, chop! Chopping with an Axe!";
}

class KnifeBehavior implements WeaponBehavior {
  @override
  String useWeapon() => "Cutting with a Knife!";
}


/*
  The abstract class that all humanoid classes inherit
*/
abstract class Humanoid {
  WeaponBehavior? weapon;

  void fight();

  setWeapon(WeaponBehavior wb) => weapon = wb;
}

class Human extends Humanoid {
  @override
  void fight() {
    print("A human: ${weapon?.useWeapon()}");
  }
}

class Troll extends Humanoid {
  @override
  void fight() {
    print("A troll: ${weapon?.useWeapon()}");
  }
}

class Elf extends Humanoid {
  @override
  void fight() {
    print("An elf: ${weapon?.useWeapon()}");
  }
}