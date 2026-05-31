# runx-calc

A calculator plugin for [Runx](https://github.com/sloppish/runx). Type math, get answers instantly.

Powered by [Qalculate](https://qalculate.github.io/) CLI.

## Usage

Trigger with the `calc` command:

```
calc 2^16
calc 5 miles to km
calc sin(pi/4)
```

Select a result to copy it to clipboard.

## Install

Requires `qalc` on your `PATH`:

```sh
brew install qalculate
```

Then add this plugin to your Runx config.

## Aliases

You can define an alias for the `calc` command in your Runx plugin config, for example to use `ca`:

```toml
[plugin.calc.aliases]
calc = "ca"
```
