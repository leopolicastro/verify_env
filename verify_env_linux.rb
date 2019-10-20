RSpec.configure do |config|
  config.color = true
  config.formatter = 'doc'
end

RSpec.describe do
  it 'Ruby version 2.2.3 or greater is installed!' do
    expect(RUBY_VERSION).to be >= "2.2"
  end
  
  it 'Chrome is installed!' do
    chrome_search = `which google-chrome`
    expect(chrome_search).to_not be_empty, "Chrome isn't installed."
  end
  
  it 'Heroku Toolbelt is installed!' do
    heroku = `which heroku`
    expect(heroku).to_not be_empty, 'Heroku Toolbelt is not installed.'
  end
  
  it 'VS Code or Sublime Text Command Line Tools are installed!' do
    vscode = `which code`
    subl = `which subl`
    expect([ vscode , subl ]).to_not satisfy { |s|
      s.all?{|search| search.empty? }
    }, "Your text editor is not configured to be launched from your Command Line."
  end
  
  it 'Postgres is installed!' do
    postgres = `which psql`
    expect(postgres).to_not be_empty, 'Postgres is not installed.'
  end

  it 'Git is installed' do
    git = `which git`
    expect(git).to_not be_empty, "Git is not installed"
  end

  it 'Git user is configured' do
    git_name = `git config --get user.name`
    git_email = `git config --get user.email`
    expect([git_email, git_name]).to_not satisfy { |searches| searches.any?(&:empty?) },
                                              "Your Git user is not configured. Run `git config --global user.name 'John Doe'` and `git config --global user.email johndoe@example.com` with your information."
  end

  it 'SQLite3 is installed!' do
    sqlite_search = `dpkg -s libsqlite3-dev`
    expect(sqlite_search).to match('ok installed'), "SQLite3 is not installed. Run `sudo apt-get install libsqlite3-dev`"
  end

  it "Node.js is installed!" do
    node_search = `which nodejs`
    expect(node_search).to_not be_empty, "Node is not installed! Run `sudo apt-get install nodejs
`"
  end

  it "Libpq is installed!" do
    libpq_search = `dpkg -s libpq-dev`
    expect(libpq_search).to match('ok installed'), "libpq-dev is not installed. Run `sudo apt-get install libpq-dev`"
  end

  it "Postgres user is created!" do
    psql_user = %x{psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='$(whoami)'"}
    expect(psql_user).to_not be_empty, "Postgres user is not set up. Run `sudo -u postgres createuser -dPs $(whoami)`"
  end

  it '.railsrc is created' do
    expect(File.exists?(File.expand_path "~/.railsrc" )).to be_truthy, "You did not create a .railsrc"
  end 

  it '.railsrc contains text' do
    text = `cat ~/.railsrc`
    expect(text).to_not be_empty, "No text in ~/.railsrc"
  end 

end