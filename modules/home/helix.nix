{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    cargo
    rustc
    rustfmt
    rust-analyzer
    lldb
    clippy
    simple-completion-language-server
    go
    # gopls
    # gotools
    gomodifytags
    gotestsum
    gcc
    nil
    nixfmt
    markdown-oxide
    codebook
    vscode-langservers-extracted
    prettier
    shfmt
    bash-language-server
    docker-compose-language-service
    dockerfile-language-server
    yamllint
    ansible-lint
    yaml-language-server
  ];

  home.file.".config/codebook/codebook.toml".text = ''
    dictionaries = [ "en_us", "ru" ]
  '';

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

        soft-wrap = {
          enable = false;
          wrap-indicator = "";
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
          name = "bash";
          auto-format = true;
          formatter = {
            command = "shfmt";
          };
        }
        {
          name = "json";
          language-servers = [
            "vscode-json-language-server"
            "scls"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "json"
            ];
          };
        }
        {
          name = "css";
          language-servers = [
            "vscode-css-language-server"
            "scls"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "css"
            ];
          };
        }
        {
          name = "html";
          language-servers = [
            "vscode-html-language-server"
            "scls"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "html"
            ];
          };
        }
        {
          name = "markdown";
          scope = "source.md";
          injection-regex = "md|markdown";
          file-types = [ "md" ];
          language-servers = [
            "markdown-oxide"
            "scls"
            "codebook"
          ];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
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
            command = lib.getExe pkgs.nixfmt;
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
        codebook = {
          command = "codebook-lsp";
          args = [ "serve" ];
        };
        markdown-oxide = {
          command = "markdown-oxide";
        };
        rust-analyzer = {
          command = "rust-analyzer";
          config = {
            # assist.insertUse.autoimport = true;
            # assist.writeImplInTee = false;
            # assist.importStyle = "self";
            # assist.importGroup = true;
            # assist.importGranularity = "crate";
            # assist.expressionFillDefault = "todo";
            # assist.todoTerms = [
            #   "todo!"
            #   "FIXME"
            #   "HACK"
            #   "NOTE"
            #   "XXX"
            # ];

            # cachePriming.enable = true;
            # cachePriming.numThreads = 4;

            # checkOnSave = true;
            # check.command = "clippy";
            # check.features = "all";
            # check.allTargets = true;
            # check.workspace = true;
            # check.ignore = [ "unused_variables" ];
            # check.invalidation.enable = true;
            # check.invalidation.unify = true;

            # diagnostics.enable = true;
            # diagnostics.experimental.enable = true;
            # diagnostics.warningsAsHint = [
            #   "unused"
            #   "dead_code"
            # ];
            # diagnostics.warningsAsInfo = [ "deprecated" ];
            # diagnostics.disabled = [
            #   "inactive-code"
            #   "unlinked-file"
            # ];
            # diagnostics.includeUnstableApi = false;
            # diagnostics.displayStyle = "link";

            # rustfmt.extraArgs = [
            #   "--edition"
            #   "2021"
            # ];
            # rustfmt.rangeFormatting.enable = true;

            # semanticHighlighting.enable = true;
            # semanticHighlighting.strings.enable = true;
            # semanticHighlighting.punctuation.enable = true;
            # semanticHighlighting.punctuation.separate.macro = true;
            # semanticHighlighting.operator.enable = true;
            # semanticHighlighting.operator.specialization.enable = true;
            # semanticHighlighting.unused.enable = true;

            # inlayHints.enable = true;
            # inlayHints.typeHints.enable = true;
            # inlayHints.typeHints.hideClosureInitialization = false;
            # inlayHints.typeHints.hideNamedConstructor = false;
            # inlayHints.typeHints.hideForTraitImpl = false;
            # inlayHints.parameterHints.enable = true;
            # inlayHints.parameterHints.hideEnabled = false;
            # inlayHints.closureCaptureHints.enable = true;
            # inlayHints.chainingHints.enable = true;
            # inlayHints.discriminantHints.enable = "always";
            # inlayHints.bindingModeHints.enable = true;
            # inlayHints.lifetimeElisionHints.enable = "never";
            # inlayHints.genericParameterHints.enable = true;
            # inlayHints.genericParameterHints.const.enable = true;
            # inlayHints.genericParameterHints.lifetime.enable = true;
            # inlayHints.genericParameterHints.type.enable = true;
            # inlayHints.implicitDrops.enable = false;
            # inlayHints.expressionAdjustmentHints.enable = "never";
            # inlayHints.reborrowHints.enable = "never";

            completion.enable = true;
            # completion.autoimport.enable = true;
            # completion.postfix.enable = true;
            # completion.addCallParenthesis = true;
            # completion.addCallArgumentSnippets = true;
            completion.callable.snippets = "add_parentheses";
            # completion.fullDocumentation = true;
            # completion.parameterLabels = false;
            # completion.snippets.custom = { };
            # completion.enableInStrings = false;
            # completion.enableInComments = false;

            # fold.enable = true;
            # fold.level = 1;
            # fold.limit = 30;

            # highlightRelated.enable = true;
            # highlightRelated.breakPoints.enable = true;
            # highlightRelated.exitPoints.enable = true;
            # highlightRelated.yieldPoints.enable = true;
            # highlightRelated.references.enable = true;
            # highlightRelated.implBlocks.enable = true;
            # highlightRelated.traitImpls.enable = true;

            # hover.enable = true;
            # hover.documentation.enable = true;
            # hover.links.enable = true;
            # hover.linksInHover = true;
            # hover.show = "documentation";
            # hover.debugInfo.enable = false;

            # hover.actions.enable = true;
            # hover.actions.debug.enable = false;
            # hover.actions.gotoTypeDef.enable = true;
            # hover.actions.implementations.enable = true;
            # hover.actions.references.enable = false;
            # hover.actions.run.enable = true;

            # procMacro.enable = true;
            # procMacro.ignore = [ ];
            # procMacro.attributes.enable = true;
            # procMacro.sysroot.enable = true;

            # interpreter.enable = true;

            # cargo.buildScripts.enable = true;
            # cargo.autoreload = true;
            # cargo.loadOutDirsFromCheck = true;
            # cargo.noDefaultFeatures = false;
            # cargo.allFeatures = false;
            # cargo.features = [ ];

            # runnables.enable = true;
            # runnables.extraArgs = [ ];
            # snippet.completion.enable = true;
            # sysroot.discover = true;
            # workspace.discoverProject = {
            #   enable = true;
            #   maxDepth = 15;
            #   maxFiles = 10000;
            # };
            # workspace.cargoFallback = true;
            # callInfo.full = true;
            # callInfo.implements = true;
            # formatStrings.enable = true;
            # relatedInformation = true;
            # restartServerOnConfigChange = true;
            # showRequestFailed = true;
            # fileSource = "auto";
            # trace.server = "off";
            # experimental = {
            #   cacheWarmup.enable = true;
            #   externSource.enable = true;
            #   termSearch.enable = true;
            #   memoryUsage.enable = true;
            #   lifetimeElision.enable = true;
            #   insertUse.autoimport = true;
            # };
          };
        };
        # rust-analyzer = {
        #   command = lib.getExe pkgs.rust-analyzer;
        #   config = {
        #     check = {
        #       command = "clippy";
        #       extraArgs = [
        #         "--all-targets"
        #         "--all-features"
        #       ];
        #     };
        #     cargo = {
        #       allFeatures = true;
        #       noDefaultFeatures = false;
        #     };
        #     diagnostics = {
        #       enable = true;
        #       styleLints.enable = true;
        #       warningsAsHint = [
        #         "unused_variables"
        #         "dead_code"
        #       ];
        #     };
        #     inlayHints = {
        #       bindingModeHints.enable = true;
        #       closingBraceHints.minLines = 10;
        #       closureReturnTypeHints.enable = "with_block";
        #       discriminantHints.enable = "fieldless";
        #       lifetimeElisionHints.enable = "skip_trivial";
        #       typeHints.hideClosureInitialization = false;
        #     };
        #     procMacro.enable = true;
        #     rustfmt.extraArgs = [ "+nightly" ];
        # completion = {
        #   snippets = {
        #     custom = {
        #       # Пример кастомного сниппета
        #       context = {
        #         postfix = "context";
        #         body = "c!($\{receiver})";
        #         description = "Wrap the expression in a c!";
        #         scope = "expr";
        #       };
        #     };
        #   };
        # };
        #   };
        # };
        # rust-analyzer = {
        #   command = "rust-analyzer";
        #   config = {
        #     inlayHints = {
        #       bindingModeHints.enable = true;
        #       closingBraceHints.minLines = 10;
        #       closureReturnTypeHints.enable = "with_block";
        #       discriminantHints.enable = "fieldless";
        #       lifetimeElisionHints.enable = "skip_trivial";
        #       typeHints.hideClosureInitialization = false;
        #     };
        #   };
        # };
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
