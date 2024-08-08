return {
    "neovim/nvim-lspconfig",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        -- make sure to setup lazydev before lspconfig
        require("lazydev").setup({
            -- add any options here, or leave empty to use the default settings
        })

        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
            local telescope_builtin = require('telescope.builtin');
            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            --vim.keymap.set('n', '<leader>wl', function()
            --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            --end, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<leader>cr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '=', vim.lsp.buf.format, bufopts)
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        require 'lspconfig'.lua_ls.setup {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        }

        require 'lspconfig'.intelephense.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                intelephense = {
                    -- possible values: stubs.txt
                    stubs = {
                        "amqp",
                        "apache",
                        "apcu",
                        "bcmath",
                        "blackfire",
                        "bz2",
                        "calendar",
                        "cassandra",
                        "com_dotnet",
                        "Core",
                        "couchbase",
                        "crypto",
                        "ctype",
                        "cubrid",
                        "curl",
                        "date",
                        "dba",
                        "decimal",
                        "dom",
                        "ds",
                        "enchant",
                        "Ev",
                        "event",
                        "exif",
                        "fann",
                        "FFI",
                        "ffmpeg",
                        "fileinfo",
                        "filter",
                        "fpm",
                        "ftp",
                        "gd",
                        "gearman",
                        "geoip",
                        "geos",
                        "gettext",
                        "gmagick",
                        "gmp",
                        "gnupg",
                        "grpc",
                        "hash",
                        "http",
                        "ibm_db2",
                        "iconv",
                        "igbinary",
                        "imagick",
                        "imap",
                        "inotify",
                        "interbase",
                        "intl",
                        "json",
                        "judy",
                        "ldap",
                        "leveldb",
                        "libevent",
                        "libsodium",
                        "libxml",
                        "lua",
                        "lzf",
                        "mailparse",
                        "mapscript",
                        "mbstring",
                        "mcrypt",
                        "memcache",
                        "memcached",
                        "meminfo",
                        "meta",
                        "ming",
                        "mongo",
                        "mongodb",
                        "mosquitto-php",
                        "mqseries",
                        "msgpack",
                        "mssql",
                        "mysql",
                        "mysql_xdevapi",
                        "mysqli",
                        "ncurses",
                        "newrelic",
                        "oauth",
                        "oci8",
                        "odbc",
                        "openssl",
                        "parallel",
                        "Parle",
                        "pcntl",
                        "pcov",
                        "pcre",
                        "pdflib",
                        "PDO",
                        "pdo_ibm",
                        "pdo_mysql",
                        "pdo_pgsql",
                        "pdo_sqlite",
                        "pgsql",
                        "Phar",
                        "phpdbg",
                        "posix",
                        "pspell",
                        "pthreads",
                        "radius",
                        "rar",
                        "rdkafka",
                        "readline",
                        "recode",
                        "redis",
                        "Reflection",
                        "regex",
                        "rpminfo",
                        "rrd",
                        "SaxonC",
                        "session",
                        "shmop",
                        "SimpleXML",
                        "snmp",
                        "soap",
                        "sockets",
                        "sodium",
                        "solr",
                        "SPL",
                        "SplType",
                        "SQLite",
                        "sqlite3",
                        "sqlsrv",
                        "ssh2",
                        "standard",
                        "stats",
                        "stomp",
                        "suhosin",
                        "superglobals",
                        "svn",
                        "sybase",
                        "sync",
                        "sysvmsg",
                        "sysvsem",
                        "sysvshm",
                        "tidy",
                        "tokenizer",
                        "uopz",
                        "uv",
                        "v8js",
                        "wddx",
                        "win32service",
                        "winbinder",
                        "wincache",
                        "wordpress",
                        "xcache",
                        "xdebug",
                        "xhprof",
                        "xml",
                        "xmlreader",
                        "xmlrpc",
                        "xmlwriter",
                        "xsl",
                        "xxtea",
                        "yaf",
                        "yaml",
                        "yar",
                        "zend",
                        "Zend OPcache",
                        "ZendCache",
                        "ZendDebugger",
                        "ZendUtils",
                        "zip",
                        "zlib",
                        "zmq",
                        "zookeeper",
                        "apache",
                        "bcmath",
                        "bz2",
                        "calendar",
                        "com_dotnet",
                        "Core",
                        "ctype",
                        "curl",
                        "date",
                        "dba",
                        "dom",
                        "enchant",
                        "exif",
                        "FFI",
                        "fileinfo",
                        "filter",
                        "fpm",
                        "ftp",
                        "gd",
                        "gettext",
                        "gmp",
                        "hash",
                        "iconv",
                        "imap",
                        "intl",
                        "json",
                        "ldap",
                        "libxml",
                        "mbstring",
                        "meta",
                        "mysqli",
                        "oci8",
                        "odbc",
                        "openssl",
                        "pcntl",
                        "pcre",
                        "PDO",
                        "pdo_ibm",
                        "pdo_mysql",
                        "pdo_pgsql",
                        "pdo_sqlite",
                        "pgsql",
                        "Phar",
                        "posix",
                        "pspell",
                        "readline",
                        "Reflection",
                        "session",
                        "shmop",
                        "SimpleXML",
                        "snmp",
                        "soap",
                        "sockets",
                        "sodium",
                        "SPL",
                        "sqlite3",
                        "standard",
                        "superglobals",
                        "sysvmsg",
                        "sysvsem",
                        "sysvshm",
                        "tidy",
                        "tokenizer",
                        "xml",
                        "xmlreader",
                        "xmlrpc",
                        "xmlwriter",
                        "xsl",
                        "Zend OPcache",
                        "zip",
                        "zlib"
                    }
                }
            }
        }

        require 'lspconfig'.volar.setup {
            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
            on_attach = on_attach,
        }

        require('lspconfig').nil_ls.setup {
            on_attach = on_attach,
            --autostart = true,
            --capabilities = capabilities,
            settings = {
                ['nil'] = {
                    testSetting = 42,
                    formatting = {
                        command = { "nixpkgs-fmt" },
                    },
                },
            },
        }

        require('lspconfig').rust_analyzer.setup {
            on_attach = on_attach,
        }

        require('lspconfig').bashls.setup {
            on_attach = on_attach,
        }

        require('lspconfig').emmet_language_server.setup {
            filetypes = { "css", "html", "javascript", "sass", "scss", "twig" },
            capabilities = capabilities
        }
    end
}
