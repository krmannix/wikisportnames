defmodule MlbHallOfFame do
  import Meeseeks.XPath

  @root "https://en.wikipedia.org"

  def run do
    make_request()
    |> get_response_body
    |> parse_names
  end

  defp make_request do
    Process.sleep(1000)
    path = @root <> "/wiki/List_of_members_of_the_Baseball_Hall_of_Fame"
    HTTPoison.get!(path)
  end

  defp get_response_body(response) do
    response.body
  end

  defp parse_names(body) do
    fetch_rows(body)
  end

  defp fetch_rows(body) do
    italicized_nodes = Meeseeks.parse(body)
    |> Meeseeks.all(xpath("//*[@id=\"mw-content-text\"]/div[1]/table[3]/tbody/tr/td[2]/i/span/span/span/a"))
    |> Enum.map(fn x -> Meeseeks.text(x) end)

    nonitalicized_nodes = Meeseeks.parse(body)
    |> Meeseeks.all(xpath("//*[@id=\"mw-content-text\"]/div[1]/table[3]/tbody/tr/td[2]/span/span/span/a"))
    |> Enum.map(fn x -> Meeseeks.text(x) end)

    italicized_nodes ++ nonitalicized_nodes
  end
end
