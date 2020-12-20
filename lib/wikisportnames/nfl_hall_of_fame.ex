defmodule NflHallOfFame do
  import Meeseeks.XPath

  @root "https://en.wikipedia.org"

  def run do
    make_request()
    |> get_response_body
    |> parse_names
  end

  defp make_request do
    Process.sleep(1000)
    path = @root <> "/wiki/List_of_Pro_Football_Hall_of_Fame_inductees"
    HTTPoison.get!(path)
  end

  defp get_response_body(response) do
    response.body
  end

  defp parse_names(body) do
    Meeseeks.parse(body)
    |> Meeseeks.all(xpath("/html/body/div[3]/div[3]/div[5]/div[1]/table[2]/tbody/tr/td[1]/span/span"))
    |> Enum.map(fn x -> Meeseeks.text(x) end)
  end
end
