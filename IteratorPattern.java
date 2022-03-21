/**
 * Written by Nobuharu Shimazu
 * Date: 2022/3/21
 * 
 * Pattern: Iterator
 * I'm using Java here because it has both the 
 * fixed-sized array and growable ArrayList
 */

import java.util.ArrayList;

class IteratorPattern {
    public static void main(String[] args) {
        BreakfastMenu breakfastMenu = new BreakfastMenu();
        LunchMenu lunchMenu = new LunchMenu();

        Waitress waitress = new Waitress(breakfastMenu, lunchMenu);

        waitress.printMenu();
    }
}

/**
 * The Iterator interface that every concrete iterators implements (home-grown Iterator)
 */
interface Iterator {
    boolean hasNext();
    MenuItem next();
}

class BreakfastMenuIterator implements Iterator {
    ArrayList<MenuItem> items;
    int position = 0;

    public BreakfastMenuIterator(ArrayList<MenuItem> items) {
        this.items = items;
    }

    public boolean hasNext() {
        if (position >= items.size()) return false;
        return true;
    }

    public MenuItem next() {
        MenuItem item = items.get(position);
        position++;
        return item;
    }
}

class LunchMenuIterator implements Iterator {
    MenuItem[] items;
    int position = 0;

    public LunchMenuIterator(MenuItem[] items) {
        this.items = items;
    }

    public boolean hasNext() {
        if (position >= items.length || items[position] == null) return false;
        return true;
    }

    public MenuItem next() {
        MenuItem menuItem = items[position];
        position++;
        return menuItem;
    }
}

/**
 * The waitress
 */
class Waitress {
    BreakfastMenu breakfastMenu;
    LunchMenu lunchMenu;

    public Waitress(BreakfastMenu breakfastMenu, LunchMenu lunchMenu) {
        this.breakfastMenu = breakfastMenu;
        this.lunchMenu = lunchMenu;
    }
    
    public void printMenu() {
        Iterator breakfastIterator = breakfastMenu.createIterator();
        Iterator lunchIterator = lunchMenu.createIterator();
        
        System.out.println("Menu\n ------ \n Breakfast");
        printMenu(breakfastIterator);
        System.out.println("Lunch");
        printMenu(lunchIterator);
    }

    private void printMenu(Iterator iterator) {
        while (iterator.hasNext()) {
            MenuItem item = iterator.next();
            System.out.print(item.getName() + ": ");
            System.out.print(item.getDescription() + " - ");
            System.out.println("$" + item.getPrice());
        }
    }
}

class MenuItem {
    private final String name;
    private final String description;
    private final boolean isVegetarian;
    private final double price;

    public MenuItem(String name, String description, boolean isVege, double price) {
        this.name = name;
        this.description = description;
        this.isVegetarian = isVege;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public boolean isVegetarian() {
        return isVegetarian;
    }
}

// -------------------------------------------------------------------------------------------

class BreakfastMenu {
    private ArrayList<MenuItem> menuItems;

    public BreakfastMenu() {
        menuItems = new ArrayList<MenuItem>();

        addMenuItem("Pancake Breakfast", "Pancakes made with fresh strawberries", true, 5.99);
        addMenuItem("Kakiage Soba", "Soba with kakiage", true, 6.59);
        addMenuItem("Waffles", "Waffles with blueberries", true, 4.99);
    }

    private void addMenuItem(String name, String description, boolean isVege, double price) {
        MenuItem item = new MenuItem(name, description, isVege, price);
        menuItems.add(item);
    }

    public Iterator createIterator() {
        return new BreakfastMenuIterator(menuItems);
    }
}

class LunchMenu {
    private static final int MAX_MENU_ITEMS = 3;
    int numberOfItems = 0;
    MenuItem[] menuItems;

    public LunchMenu() {
        addMenuItem("Blah x3", "Blah blah blah", false, 8.79);
        addMenuItem("Blah Sandwich", "Blah blah blah", true, 7.00);
        addMenuItem("Blah Special", "Blah blah blah", false, 10.99);
    }

    private void addMenuItem(String name, String description, boolean isVege, double price) {
        MenuItem item = new MenuItem(name, description, isVege, price);
        if (numberOfItems >= MAX_MENU_ITEMS) System.err.println("Menu is full");
        
        menuItems[numberOfItems] = item;
        numberOfItems++;
    }

    public Iterator createIterator() {
        return new LunchMenuIterator(menuItems);
    }
}