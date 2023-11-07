#include <gtk/gtk.h>

static void
activate (GtkApplication* app,
          gpointer        user_data)
{
  GtkWidget *window;
  GtkWidget *menu_bar;
  GMenu *menu_model;

  window = gtk_application_window_new (app);
  gtk_window_set_title (GTK_WINDOW (window), "Window");
  gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);

  // Create a menu bar widget
  menu_bar = gtk_popover_menu_bar_new ();

  // Create a menu model with a File menu and a Quit menu item
  menu_model = g_menu_new ();
  g_menu_append (menu_model, "File", "file");
  g_menu_append_submenu (menu_model, "Quit", g_menu_new ());

  // Set the menu model of the menu bar
  gtk_popover_menu_bar_set_menu_model (GTK_POPOVER_MENU_BAR (menu_bar), G_MENU_MODEL (menu_model));

  // Set the menu bar as the title bar of the window
  gtk_window_set_titlebar (GTK_WINDOW (window), menu_bar);

  gtk_window_present (GTK_WINDOW (window));
}

int
main (int    argc,
      char **argv)
{
  GtkApplication *app;
  int status;

  app = gtk_application_new ("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
  g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
  status = g_application_run (G_APPLICATION (app), argc, argv);
  g_object_unref (app);

  return status;
}