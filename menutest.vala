// menutest.vala

using Gtk;

public class Menutest : Gtk.Application {

    public Menutest() {
        Object (application_id: "org.gtk.menutest");
    }

    protected override void activate() {
        var window = new ApplicationWindow (this);
        window.title = "Hello World";
     
        // Create a menu with two items
        var menu = new Menu();
        menu.insert(0, "Hello", "app.hello");
        menu.insert(1, "Quit", "app.quit");

        // Set the menu as the application's menubar
        this.set_menubar(menu);

        // Define the actions for the menu items
        SimpleAction hello = new SimpleAction("hello", null);
        hello.activate.connect(hello_action);
        this.add_action(hello);

        SimpleAction quit = new SimpleAction("quit", null);
        quit.activate.connect(quit_action);
        this.add_action(quit);

        window.present();
    }

    public static int main (string[] args) {
        return new Menutest().run (args);
    }

    // The callback function for the "Hello" action
    private void hello_action (SimpleAction action, Variant? parameter) {
        print ("Hello, world!\n");
    }

    // The callback function for the "Quit" action
    private void quit_action (SimpleAction action, Variant? parameter) {
        this.quit ();
    }
}