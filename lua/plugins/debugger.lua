return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    -- Configurar adapter para Node.js usando Mason
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
            .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    -- Configurações para JavaScript
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch Node.js",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }

    -- Configurações para TypeScript
    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch via nodemon debug",
        runtimeExecutable = "npm",
        runtimeArgs = { "run", "dev:debug" },
        console = "integratedTerminal",
        skipFiles = { "<node_internals>/**" },
        sourceMaps = true,
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to nodemon debug",
        port = 9229,
        address = "localhost",
        localRoot = "${workspaceFolder}",
        remoteRoot = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**" },
        sourceMaps = true,
      },
    }
    dap.configurations.javascript = dap.configurations.typescript
  end,
}
