// Save this code as "simple_app.vala"
public class SimpleApp : Gtk.Application {

    public SimpleApp () {
        // Call the parent constructor with the application id
        Object (application_id: "com.example.SimpleApp");
    }

    protected override void activate () {
        // Create a new window for the application
        var window = new Gtk.ApplicationWindow (this);

        // Create a new label widget
        var label = new Gtk.Label ("Hello, world!");

        // Create a new button widget
        var button = new Gtk.Button.with_label ("Click me");

        // Connect the clicked signal to a callback function
        button.clicked.connect (() => {
            // Change the label text when the button is clicked
            label.set_text ("You clicked the button!");
        });

        // Create a new grid widget to arrange the widgets
        var grid = new Gtk.Grid ();
        grid.set_column_spacing (12);
        grid.set_row_spacing (12);
        grid.set_margin_top (12);
        grid.set_margin_bottom (12);
        grid.set_margin_start (12);
        grid.set_margin_end (12);

        // Add the widgets to the grid
        grid.attach (label, 0, 0, 1, 1);
        grid.attach (button, 0, 1, 1, 1);

        // Add the grid to the window
        window.set_child (grid);

        // Show the window
        window.present ();
    }
}

// Run the application
int main (string[] args) {
    return new SimpleApp ().run (args);
}
