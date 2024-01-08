# Gleam Devcontainer

This repo defines a [devcontainer](https://containers.dev)
for writing [Gleam](https://gleam.run) code in [VSCode](https://code.visualstudio.com), particularly
using [GitHub CodeSpaces](https://github.com/features/codespaces).

In order to use this, you'll define a `.devcontainer/devcontainer.json` file
in your repo with content that looks something like this

```json
{
    "name": "Gleam",
        "image": "ghcr.io/stts-code-club/gleam-devcontainer:v0.2",
    "customizations": {
                "vscode": {
                        "extensions": [
                                "tamasfe.even-better-toml",
                                "gleam.gleam",
                                "editorconfig.editorconfig",
                                "github.copilot",
                                "github.copilot-chat"
                        ]
                }
        }
}
```

You can see [more instructions here](https://code.visualstudio.com/docs/devcontainers/create-dev-container).
Having done that, you can easily tell VSCode to edit your code inside the devcontainer.

