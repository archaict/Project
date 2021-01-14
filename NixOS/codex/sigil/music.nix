{ config, pkgs, lib, ... }:

{
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = ~/Music;
    settings = {

      ncmpcpp_directory = "~/.local/share/.ncmpcpp";
      message_delay_time = "2";
      playlist_shorten_total_times = "yes";
      playlist_display_mode = "classic";
      playlist_editor_display_mode = "columns";
      
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      
      autocenter_mode = "yes";
      mouse_support = "yes";
      centered_cursor = "yes";
      user_interface = "classic";
      follow_now_playing_lyrics = "yes";
      locked_screen_width_part = "60";
      display_bitrate = "no";
      external_editor = "vim";

      progressbar_elapsed_color = "yellow";
      progressbar_color = "yellow";
      progressbar_look = "──";
      
      header_visibility = "no";
      statusbar_visibility = "yes";
      titles_visibility = "no";

      statusbar_color = "yellow";
      enable_window_title = "yes";

      now_playing_prefix = "$b$3";
      now_playing_suffix = "$2$/b";

      song_columns_list_format = "(6)[yellow]{} (23)[red]{a} (26)[yellow]{t|f} (40)[green]{b} (4)[blue]{l}";

      song_list_format = "$3> $2 %a $4 / $4 %t $R $3 %l  ";
      song_status_format = "$b$7♫ $2%a $4- $3%b $4- $2%t ";
      song_window_title_format = " {%a} - {%t}";


    };
    bindings = [
      { key = "h"; command = "previous_column"; }
      { key = "l"; command = "next_column"; }
      { key = "H"; command = "previous"; }
      { key = "L"; command = "next"; }
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "n"; command = "next_found_item"; }
      { key = "N"; command = "previous_found_item"; }
      { key = "="; command = "volume_up"; }
      { key = "-"; command = "volume_down"; }
    ];
  };

}
