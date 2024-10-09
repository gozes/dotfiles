--- https://who.ldelossa.is/posts/gh-nvim/
--- https://www.youtube.com/watch?v=hhrWwYfMK1I
return {
  'ldelossa/gh.nvim',
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
