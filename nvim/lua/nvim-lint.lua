local status_ok, lint = pcall(require, "lint")
if not status_ok then
  return
end

lint.linters_by_ft = {
  cpp = {'cppcheck',},

  default_severity = {
    ['error'] = vim.diagnostic.severity.ERROR,
    ['warning'] = vim.diagnostic.severity.WARN,
    ['information'] = vim.diagnostic.severity.INFO,
    ['hint'] = vim.diagnostic.severity.HINT,
  }
}

