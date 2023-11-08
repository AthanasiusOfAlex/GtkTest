using Gtk;

public class Minimal : Gtk.Application {

    public Minimal() {
        Object (application_id: "org.gtk.minimal");
    }

    protected override void activate() {
        var window = new ApplicationWindow (this);
        window.title = "Hello World";
        window.present();
    }

    public static int main (string[] args) {
        return new Minimal().run (args);
    }
}