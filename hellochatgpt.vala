using Gtk;
//using Gtk.Menu;
//using Gtk.MenuItem;

public class HelloApp : Gtk.Application {

    public HelloApp () {
        Object (application_id: "org.gtk.hello");
    }

    protected override void activate () {
        var window = new ApplicationWindow (this);
        window.title = "Hello World";

        var button = new Button.with_label ("Click me!");
        button.clicked.connect (() => {
            button.label = "Thank you";
        });

        // Create a new grid widget to arrange the widgets
        var grid = new Gtk.Grid ();
        grid.set_column_spacing (12);
        grid.set_row_spacing (12);
        grid.set_margin_top (24);
        grid.set_margin_bottom (24);
        grid.set_margin_start (48);
        grid.set_margin_end (48);

        // Add the widgets to the grid
        grid.attach (button, 0, 0, 1, 1);

        window.set_child (grid);

        // Create a menu bar
        var menubar = new MenuBar();
        window.set_child(menubar);

        // Create a menu item
        var menuitem = new MenuItem("File");

        // Create a submenu with menu items
        var submenu = new Menu();
        menuitem.set_submenu(submenu);

        var submenuitem1 = new MenuItem("Open");
        submenu.append(submenuitem1);

        var submenuitem2 = new MenuItem("Save");
        submenu.append(submenuitem2);

        // Add the menu item to the menu bar
        menubar.append(menuitem);

        window.present ();
    }

    public static int main (string[] args) {
        return new HelloApp ().run (args);
    }
}