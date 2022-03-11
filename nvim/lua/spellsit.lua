local status_ok, spellsit = pcall(require, "spellsitter")
if not status_ok then
  return
end
spellsit.setup {
  enable = true,
}
