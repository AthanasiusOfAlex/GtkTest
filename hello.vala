using Gtk;

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
        // grid.attach (label, 0, 0, 1, 1);
        grid.attach (button, 0, 0, 1, 1);

        window.set_child (grid);
        window.present ();
    }

    public static int main (string[] args) {
        return new HelloApp ().run (args);
    }
}
