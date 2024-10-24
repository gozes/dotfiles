--- https://who.ldelossa.is/posts/gh-nvim/
--- gh demo: https://www.youtube.com/watch?v=hhrWwYfMK1I
--- git worktree workflow: https://www.youtube.com/watch?v=VMJ1eAj5HgI and https://nicknisi.com/posts/git-worktrees/
return {
  'ldelossa/gh.nvim',
  opts = {
    map_resize_keys = true,
  },
  keys = {
    { '<leader>Gho', '<cmd>GHOpenPR<cr>', desc = 'Github List PRs' },
    { '<leader>Ghtt', '<cmd>GHToggleThread<cr>', desc = 'Github Toggle Thread' },
    { '<leader>Ghtn', '<cmd>GHNextThread<cr>', desc = 'Github Next Thread' },
    { '<leader>Ghtc', '<cmd>GHCreateThread<cr>', desc = 'Github Create Thread' },
    { '<leader>Ghs', '<cmd>GHSearchPRs<cr>', desc = 'Github Search PRs' },
    { '<leader>Ghrs', '<cmd>GHStartReview<cr>', desc = 'Github Start PR Review' },
    { '<leader>Ghrd', '<cmd>GHDeleteReview<cr>', desc = 'Github Delete PR Review' },
    { '<leader>GhrS', '<cmd>GHSubmitReview<cr>', desc = 'Github Submit PR Review' },
    { '<leader>Ghrr', '<cmd>GHRequestedReview<cr>', desc = 'Github Show Review Requests' },
    { '<leader>Ghra', '<cmd>GHApproveReview<cr>', desc = 'Github Approve PR' },
    { '<leader>Ghn', '<cmd>GHNotifications<cr>', desc = 'Github Repo Notifications' },
  },
  cond = function()
    vim.fn.system 'which gh'
    if vim.v.shell_error ~= 0 then
      return false
    end
    return true
  end,
  dependencies = {
    {
      'ldelossa/litee.nvim',
      config = function()
        require('litee.lib').setup()
      end,
    },
  },
  config = function()
    require('litee.gh').setup()
  end,
}
