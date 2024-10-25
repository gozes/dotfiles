--- https://who.ldelossa.is/posts/gh-nvim/
--- gh demo: https://www.youtube.com/watch?v=hhrWwYfMK1I
--- git worktree workflow: https://www.youtube.com/watch?v=VMJ1eAj5HgI and https://nicknisi.com/posts/git-worktrees/
return {
  'ldelossa/gh.nvim',
  opts = {
    map_resize_keys = true,
  },
  keys = {
    { '<leader>Go', '<cmd>GHOpenPR<cr>', desc = 'Github List PRs' },
    { '<leader>Gtt', '<cmd>GHToggleThread<cr>', desc = 'Github Toggle Thread' },
    { '<leader>Gtn', '<cmd>GHNextThread<cr>', desc = 'Github Next Thread' },
    { '<leader>Gtc', '<cmd>GHCreateThread<cr>', desc = 'Github Create Thread' },
    { '<leader>Gs', '<cmd>GHSearchPRs<cr>', desc = 'Github Search PRs' },
    { '<leader>Grs', '<cmd>GHStartReview<cr>', desc = 'Github Start PR Review' },
    { '<leader>Grd', '<cmd>GHDeleteReview<cr>', desc = 'Github Delete PR Review' },
    { '<leader>GrS', '<cmd>GHSubmitReview<cr>', desc = 'Github Submit PR Review' },
    { '<leader>Grr', '<cmd>GHRequestedReview<cr>', desc = 'Github Show Review Requests' },
    { '<leader>Gra', '<cmd>GHApproveReview<cr>', desc = 'Github Approve PR' },
    { '<leader>Gn', '<cmd>GHNotifications<cr>', desc = 'Github Repo Notifications' },
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
