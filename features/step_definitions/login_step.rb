  #----------Given----------

  login_page = LoginPage.new
  
  Given("open pokedex") do
    visit 'https://www.pokemon.com/us/pokedex/'
    login_page.dismiss_cookie.click
  end

  Given("on login screen") do
    login_page.login.click
  end

  #----------When----------
  
  When("insert user name {string} and password") do |username|
    login_page.username.set username
    login_page.password.set "HnD.3Jn5DKHN!wK"
    login_page.log_in.click
  end

  When("insert user name {string} and wrong password") do |username|
    find('#username').set username
    find('#password').set "1234567"
    click_on 'Sign In'
  end
  
  When("realize logoff") do
    click_on 'Log Out'
  end
  
  #----------Then----------

  Then("we are logged") do
    expect(page).to have_content "Tassioplima"
  end
  
  Then("receive feedback your user name or password is incorrect") do
    expect(page).to have_content "Your username or password is incorrect. You have 4 attempts left before you will be locked out of your account for 15 minutes."
  end
  
  Then("we are unlogged") do
    expect(page).to have_current_path("https://www.pokemon.com/us/", url: true)
  end