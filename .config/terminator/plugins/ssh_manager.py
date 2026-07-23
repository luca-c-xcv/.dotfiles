import os
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
from paramiko.config import SSHConfig

AVAILABLE = ['SSHManagerPlugin']

class SSHManagerPlugin:
    capabilities = ['terminal_menu']

    def __init__(self):
        self.hosts = self.load_hosts()

    def terminate(self):
        pass

    # -------------------------
    # LOAD SSH CONFIG
    # -------------------------
    def load_hosts(self):
        path = os.path.expanduser("~/.ssh/config")

        if not os.path.exists(path):
            return []

        config = SSHConfig()
        with open(path) as f:
            config.parse(f)

        hosts = []
        for entry in config._config:
            if 'host' in entry:
                hosts.extend(entry['host'])

        # remove wildcards + duplicates
        return sorted(set(h for h in hosts if '*' not in h))

    # -------------------------
    # MENU ENTRY
    # -------------------------
    def callback(self, menuitems, menu, terminal):
        ssh_menu = Gtk.MenuItem(label="SSH Manager")

        submenu = Gtk.Menu()

        # Search / main entry
        search_item = Gtk.MenuItem(label="Search & Connect")
        search_item.connect("activate", self.open_search, terminal)
        submenu.append(search_item)

        # Quick list
        for host in self.hosts:
            item = Gtk.MenuItem(label=host)
            item.connect("activate", self.connect_ssh, terminal, host)
            submenu.append(item)

        ssh_menu.set_submenu(submenu)
        menuitems.append(ssh_menu)

    # -------------------------
    # SIMPLE CONNECT
    # -------------------------
    def connect_ssh(self, widget, terminal, host):
        terminal.feed(f"ssh {host}\n")

    # -------------------------
    # SEARCH DIALOG
    # -------------------------
    def open_search(self, widget, terminal):
        dialog = Gtk.Dialog(title="SSH Connect")
        dialog.set_default_size(300, 400)

        box = dialog.get_content_area()

        entry = Gtk.Entry()
        entry.set_placeholder_text("Type host name...")

        listbox = Gtk.ListBox()

        rows = []

        def rebuild(filter_text=""):
            # clear
            for r in listbox.get_children():
                listbox.remove(r)

            for host in self.hosts:
                if filter_text.lower() in host.lower():
                    row = Gtk.ListBoxRow()
                    label = Gtk.Label(label=host, xalign=0)
                    row.add(label)
                    listbox.add(row)

            listbox.show_all()

        def on_change(entry):
            rebuild(entry.get_text())

        def on_select(listbox, row):
            host = row.get_child().get_text()
            terminal.feed(f"ssh {host}\n")
            dialog.destroy()

        entry.connect("changed", on_change)
        listbox.connect("row-activated", on_select)

        box.add(entry)
        box.add(listbox)

        rebuild()

        dialog.show_all()
