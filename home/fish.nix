{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      cl = "clear";
      lg = "lazygit";
      mk = "mkdir";
      ll = "exa -la";
      l = "exa -l";
      ls = "exa";
      cn = "touch";
    };

    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };

      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };

    interactiveShellInit = ''


      # close greet word
      set -U fish_greeting ""

      # export environment

      ## shell environment
      set -gx FZF_DEFAULT_COMMAND "fd --hidden"
      set -gx EDITOR 'nvim'

      ## rust environment
      set -gx RUSTUP_DIST_SERVER "https://mirrors.ustc.edu.cn/rust-static"
      set -gx RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"

      ## flutter environment
      set -gx FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"
      set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
      set -gx CHROME_EXECUTABLE "/usr/bin/google-chrome-stable"
      set -gx ANDROID_HOME $HOME/Android/Sdk/
      set -gx NO_PROXY localhost,::1,127.0.0.1


      # environment variable
      function proxy
        # set -gx all_proxy socks://127.0.0.1:1089/
        set -gx http_proxy http://127.0.0.1:7890
        set -gx https_proxy http://127.0.0.1:7890
      end

      function unproxy
      	set -e http_proxy
      	set -e https_proxy
      end


      # fzf
      bind -M insert \cf _fzf_search_directory

      # fish vi mode
      fish_vi_key_bindings
      set -g fish_vi_force_cursor true

      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      set -g fish_cursor_visual block

      bind -M insert \cn down-or-search
      bind -M insert \cp up-or-search 
      bind -M insert \cb backward-char
      bind -M insert \cf forward-char 
      bind -M insert \ca beginning-of-line
      bind -M insert \ce end-of-line

      function fish_mode_prompt --description "Displays the current mode"
          switch $fish_bind_mode
              case default
                  set_color --bold --background red white
                  echo ""
              case insert
                  set_color --bold --background blue white
                  echo ""
              case visual
                  set_color --bold --background magenta white
                  echo ""
          end
          set_color normal
          echo -n " "
      end

      # function lf
      #     set tmp (mktemp)
      #     /bin/lf -last-dir-path=$tmp $(pwd)
      #     if test -f "$tmp"
      #         set dir (cat $tmp)
      #         rm -f $tmp
      #         if test -d "$dir"
      #             if test "$dir" != (pwd)
      #                 cd $dir
      #             end
      #         end
      #     end
      # end

      # fzf
      set -U FZF_DISABLE_KEYBINDINGS 1


      # set -g hydro_symbol_prompt "->"
      # set -g hydro_color_pwd "#a29bfe"
      # set -g hydro_color_prompt "#38ada9"
      # set -g hydro_color_git "#fa983a"
      # set -g pure_symbol_prompt "->"
      # set -g pure_symbol_reverse_prompt "<-"

      set -gx PATH $PATH:$HOME/.npm-global/bin:$HOME/.local/bin:$HOME/go/bin

    '';

    plugins = [{
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
        sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
      };
    }];
  };
}
