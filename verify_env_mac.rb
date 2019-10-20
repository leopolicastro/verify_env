RSpec.configure do |config|
    config.color = true
    config.formatter = 'doc'
  end
  
  def lsregister_grep(search)
    `/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/\
  lsregister -dump | grep -i "#{search}"`
  end
  
  RSpec.describe do
    it 'Ruby version 2.2.3 or greater is installed.' do
      expect(RUBY_VERSION).to be >= "2.2.3"
    end
  
    # it 'Chrome is installed.' do
    #   chrome_search = lsregister_grep('google chrome')
    #   expect(chrome_search).to_not be_empty,
    #                                "Chrome isn't installed."
    # end
  
    it 'Heroku Toolbelt is installed.' do
      heroku = `which heroku`
      expect(heroku).to_not be_empty,
                            'Heroku Toolbelt is not installed.'
    end
  
    # it 'VSCode or Sublime Text is installed.' do
    #   which_code = lsregister_grep(`VSCode`)
    #   subl_search = lsregister_grep('Sublime Text')
    #   expect([which_code, subl_search]).to_not satisfy { |searches| searches.all?(&:empty?) },
    #                                             "Couldn't find either Sublime Text or Atom installed on your system."
    # end
  
    # it 'Atom Command Line Tools are installed.' do
    #   atom = `which atom`
    #   subl = `which subl`
    #   expect([atom, subl]).to_not satisfy { |s| s.all?(&:empty?) },
    #                               "Your text editor is not configured to be launched from your Command Line.\
    #                               Open Atom, and select Atom > Install Shell Commands"
    # end
  
    it 'Homebrew is installed.' do
      brew = `which brew`
      expect(brew).to_not be_empty,
                          'Homebrew is not installed.'
    end
  
  
    it 'XCode Command Line Tools are installed.' do
      xcode_cli = `xcrun -f xcode-select`
      
      
      expect(xcode_cli).to match(/\/usr\/bin\/xcode-select/),
                              "Xcode is not installed. Open the Mac App Store and install and/or update 'Xcode'."
    end
    
    it 'Version 10.x or greater of Xcode Command Line Tools is installed.' do
      xcode_cli = `pkgutil --pkg-info=com.apple.pkg.CLTools_Executables`
      expect(xcode_cli).to match(/version: 1[0-9]+\.[0-9]+/),
        "Xcode Command Line Tools 10.x or greater are not installed."
    end
  
  
    # it 'Postgres App is installed.' do
    #   postgres_search = lsregister_grep('postgres')
    #   expect(postgres_search).to_not be_empty,
    #                                  "Postgres App is not installed, visit http://postgresapp.com to install."
    # end
  
    it 'Postgres Command Line Tools are installed.' do
      postgres = `which psql`
      expect(postgres).to_not be_empty,
                              "Postgres Command Line tools are not installed. Run 'brew install postgresql' to install."
    end
  
  
    it 'Git is installed.' do
      git = `which git`
      expect(git).to_not be_empty,
                         "Git is not installed"
    end
  
    it 'Git user is configured.' do
      git_name = `git config --get user.name`
      git_email = `git config --get user.email`
      expect([git_email, git_name]).to_not satisfy { |searches| searches.any?(&:empty?) },
                                                "Your Git user is not configured. Run `git config --global user.name \"John Doe\"` and `git config --global user.email johndoe@example.com` with your information."
    end
  end
  
  