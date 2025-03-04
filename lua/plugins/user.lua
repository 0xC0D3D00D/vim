if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
  event = { "BufReadPre", "BufNewFile" },
  ft = { 'go', 'php', 'javascript', 'typescript', 'vue', 'html', 'css', 'scss', 'json', 'yaml', 'markdown', 'lua' },
  cond = function()
    return vim.env.GITLAB_TOKEN ~= nil and
           vim.env.GITLAB_TOKEN ~= '' and
           vim.env.GITLAB_URL ~= nil and
           vim.env.GITLAB_URL ~= ''
  end,
  opts = {
    gitlab_url = vim.env.GITLAB_URL,
    resource_editing = {
      enabled = true,
    },
    statusline = {
      enabled = true,
    },
  },
}
