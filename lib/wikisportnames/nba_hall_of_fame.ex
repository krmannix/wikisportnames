defmodule NbaHallOfFame do
  import Meeseeks.XPath

  @root "https://en.wikipedia.org"

  def run do
    make_request()
    |> get_response_body
    |> parse_names
  end

  defp make_request do
    path = @root <> "/wiki/List_of_players_in_the_Naismith_Memorial_Basketball_Hall_of_Fame"
    HTTPoison.get!(path)
  end

  defp get_response_body(response) do
    response.body
  end

  defp parse_names(body) do
    Meeseeks.parse(body)
    |> Meeseeks.all(xpath("/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/span/span/span/a"))
    |> Enum.map(fn x -> Meeseeks.text(x) end)
  end
end
