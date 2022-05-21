vim.o.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

local local_session_folder = (os.getenv('HOME')..'/.config/nvim/sessions/')

local settings = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = local_session_folder,
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
}

return settings
