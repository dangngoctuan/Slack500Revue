namespace :slack_500_revue do
  desc 'configuration slack_500_revue'
  task :config do
    file = File.join(Rails.root,'config','initializers','slack_500_revue.rb')
    if File.exists?(file)
      puts "#{file} esxits. overwrite? (y/n)"
      s = STDIN.getc
      exit unless s[0].downcase == 'y'
    end
    File.open(file,'w') do |file|
      file.puts("require 'slack_500_revue'")
      file.puts("\nSlack500Revue.setup do |config|")

      file.puts("\n    # report pretext of slack message")
      file.puts("    config.pretext = 'Slack Report Title'")

      file.puts("\n    # report title of slack message")
      file.puts("    config.title = 'Rendering 500 with exception.'")

      file.puts("\n    # color of slack message")
      file.puts("    config.color = '#FF0000'")

      file.puts("\n    # footer text of slack message")
      file.puts("    config.footer = 'via Slack 500 Report.'")

      file.puts("\n    # WebHook URL")
      file.puts("    # see https://slack.com/services/new/incoming-webhook")
      file.puts("    config.webhook_url = '(Your Slack WebHook URL)https://hooks.slack.com/services/xxxxxxxxx/xxxx'")

      file.puts("\nend")
    end
    puts "Slack500Revue:: you need edit #{file}."
  end
end
