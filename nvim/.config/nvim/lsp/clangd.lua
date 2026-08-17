return {
  cmd = { "clangd", "--compile-commands-dir=build" },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}
