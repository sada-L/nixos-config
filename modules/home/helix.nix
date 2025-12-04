{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    rustup
    simple-completion-language-server
    go
    gopls
    gotools
    gomodifytags
    gotestsum
    gcc
    nil
    nixfmt-rfc-style
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "my_theme";

      editor = {
        scroll-lines = 1;
        scrolloff = 5;
        cursorline = true;
        cursorcolumn = false;
        completion-timeout = 50;
        completion-trigger-len = 1;
        true-color = true;
        bufferline = "multiple";
        color-modes = true;
        trim-final-newlines = true;
        trim-trailing-whitespace = true;
        popup-border = "all";

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = true;
        };

        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
          display-progress-messages = true;
          auto-signature-help = true;
        };

        auto-format = true;

        statusline = {
          left = [
            "mode"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          center = [ "diagnostics" ];
          right = [
            "file-type"
            "total-line-numbers"
            "position"
            "file-encoding"
            "spinner"
          ];
          separator = "|";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
          diagnostics = [
            "warning"
            "error"
          ];
          workspace-diagnostics = [
            "warning"
            "error"
          ];
        };

        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "disable";
        };
      };

      keys = {
        normal = {
          space = {
            q = ":wq";
            Q = ":q!";
            c = {
              c = ":buffer-close";
              o = ":buffer-close-others";
            };
          };

          H = ":buffer-previous";
          L = ":buffer-next";
          C-s = ":write";
          K = "hover";
        };
      };
    };

    languages = {
      language = [
        {
          name = "rust";
          scope = "source.rust";
          injection-regex = "rs|rust";
          file-types = [ "rs" ];
          roots = [
            "Cargo.toml"
            "Cargo.lock"
          ];
          shebangs = [
            "rust-script"
            "cargo"
          ];
          auto-format = true;
          comment-tokens = [
            "//"
            "///"
            "//!"
          ];
          block-comment-tokens = [
            {
              start = "/*";
              end = "*/";
            }
            {
              start = "/**";
              end = "*/";
            }
            {
              start = "/*!";
              end = "*/";
            }
          ];
          language-servers = [
            "rust-analyzer"
            "scls"
          ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          persistent-diagnostic-sources = [
            "rustc"
            "clippy"
          ];
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = [
            "nix"
            "nixd"
            "scls"
          ];
          indent = {
            tab-width = 2;
            unit = " ";
          };
          formatter = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
        }
        {
          name = "go";
          auto-format = true;
          roots = [
            "go.mod"
            "go.sum"
            "go.work"
          ];
          comment-token = "//";
          block-comment-tokens = {
            start = "/*";
            end = "*/";
          };
          language-servers = [
            "gopls"
            "scls"
          ];
          indent = {
            tab-width = 2;
            unit = " ";
          };
          formatter = {
            command = "goimports";
          };
        }
        {
          name = "stub";
          scope = "text.stub";
          file-types = [ ];
          shebangs = [ ];
          roots = [ ];
          auto-format = false;
          language-servers = [ "scls" ];
        }
      ];

      language-server = {
        rust-analyzer = {
          command = "rust-analyzer";
          config = {
            inlayHints = {
              bindingModeHints.enable = true;
              closingBraceHints.minLines = 10;
              closureReturnTypeHints.enable = "with_block";
              discriminantHints.enable = "fieldless";
              lifetimeElisionHints.enable = "skip_trivial";
              typeHints.hideClosureInitialization = false;
            };
          };
        };
        nix = {
          command = "nil";
          args = [ "--stdio" ];
          scope = "source.nix";
        };
        scls = {
          command = "simple-completion-language-server";
          config = {
            max_completion_items = 100; # set max completion results len for each group: words, snippets, unicode-input
            feature_words = true; # enable completion by word
            feature_snippets = true; # enable snippets
            snippets_first = true; # completions will return before snippets by default
            snippets_inline_by_word_tail = true; # suggest snippets by WORD tail, for example text `xsq|` become `x^2|` when snippet `sq` has body `^2`
            feature_unicode_input = true; # enable "unicode input"
            feature_paths = true; # enable path completion
            citation = true;
            feature_citations = true; # enable citation completion (only on `citation` feature enabled)
          };
        };
        gopls = {
          command = "gopls";
          scope = "source.go";
          config = {
            gofumpt = true;
            local = "goimports";
            semanticTokens = true;
            staticcheck = true;
            verboseOutput = true;
            analyses = {
              nilness = true;
              unusedparams = true;
              unusedwrite = true;
              useany = true;
            };
            usePlaceholders = false;
            completeUnimported = true;
            hints = {
              assignVariableType = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
          };
        };
      };
    };

    themes = {
      my_theme = {
        "inherits" = "tokyonight_moon";
        "ui.virtual.inlay-hint" = {
          fg = "#636da6";
        };
      };
    };
  };
}
