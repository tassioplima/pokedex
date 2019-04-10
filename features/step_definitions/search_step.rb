search_page = SearchPage.new

  #----------When----------#

  When("search a pokemon {string}") do |pokemon|
    @pokemon = pokemon
    search_page.pokedex.click
    search_page.search_input.set pokemon
    search_page.confirm_input.click
  end

  #----------Then----------#

  Then("wild pokemon appeared!") do
    expect(page).to have_content @pokemon
  end
  
  Then("wild pokemon disappeared!") do
    expect(page).to have_no_content @pokemon
  end

  