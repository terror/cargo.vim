## cargo.vim

Simple vim command bindings to quickly run cargo stuff from vim.

### Installation

Use your vim plugin manager of choice, for instance vim-plug:

```bash
Plug 'terror/cargo.vim'
```
### Usage

Simply run one of the commands. By default it just delegates to cargo.

You can overwrite g:cargo_command to, for instance, support dispatch:

```
let g:cargo_command = "Dispatch cargo {cmd}"
```

### Commands

* CargoBench
* CargoBuild
* CargoClean
* CargoDoc
* CargoNew
* CargoRun
* CargoTest
* CargoUpdate
