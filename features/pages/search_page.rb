class SearchPage < SitePrism::Page

    set_url "https://www.pokemon.com/us/pokedex/"

    element :search_input, '#searchInput'
    element :confirm_input, '#search'
    element :pokedex, '[class="title title_pokeball"]'
end    