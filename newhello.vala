using Gtk;

public class Menutest : Gtk.Application {

    public Menutest() {
        Object (application_id: "org.gtk.menutest");
    }

    protected override void activate() {
        var window = new ApplicationWindow (this);
        window.title = "Hello World";
     
        // Create root menu (menu bar).
        var menu = new Menu ();
        
        // Create window submenu and insert (The "Window" entry you'll see in the menu bar)
        var window_menu = new Menu ();
        window_menu.insert(0, "Hello", "app.hello");
        window_menu.insert(1, "Quit", "app.quit");

        // Add window submenu to menu bar
        menu.append_submenu ("Window", window_menu);
        
        // Set the menu as the application's menubar
        this.set_menubar(menu);
        window.set_show_menubar (true);

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