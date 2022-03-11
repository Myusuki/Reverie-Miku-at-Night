local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  return
end

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}
