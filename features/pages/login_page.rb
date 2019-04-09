class LoginPage < SitePrism::Page
    set_url"https://www.pokemon.com/us/pokedex/"

    element :dismiss_cookie, '#cookie-dismisser'
    element :login, "li[class='visible-not-signed-in sign-up']"
    element :username, '#username'
    element :password, '#password'
    element :log_in, '#btnLogin'
end    