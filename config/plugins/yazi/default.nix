{
  plugins.yazi = {
    enable = true;
    settings = {
      enable_mouse_support = true;
      floating_window_scaling_factor = 0.5;
      log_level = "debug";
      open_for_directories = true;
      yazi_floating_window_border = "single";
      yazi_floating_window_winblend = 50;

      keymaps = {
        copy_relative_path_to_selected_files = "<c-y>";
        cycle_open_buffers = "<tab>";
        grep_in_directory = "<c-s>";
        open_file_in_horizontal_split = "<c-x>";
        open_file_in_tab = "<c-t>";
        open_file_in_vertical_split = "<c-v>";
        replace_in_directory = "<c-g>";
        send_to_quickfix_list = "<c-q>";
        show_help = "<f1>";

      };
    };

  };
}
