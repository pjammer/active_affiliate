namespace :active_affiliate do
  desc "Sync migration files into existing app"
  task :sync do
    system "rsync -ruv vendor/plugins/active_affiliate/db/migrate db"
  end
end