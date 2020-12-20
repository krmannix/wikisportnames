defmodule MlbAllstarGame do
  import Meeseeks.XPath

  @root "https://en.wikipedia.org"

  def run do
    make_requests()
  end

  defp make_requests do
    Enum.map([
      {"/wiki/2000_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2001_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2002_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2003_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2004_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2005_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2006_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2007_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2008_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2009_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2010_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2011_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2012_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2013_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2014_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2015_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2016_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]"},
      {"/wiki/2017_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td/table/tbody/tr/th"},
      {"/wiki/2018_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td/table/tbody/tr/th"},
      {"/wiki/2019_Major_League_Baseball_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td/table/tbody/tr/th"},
    ],
    fn {path, xpath} -> fetch_and_parse(path, xpath) end)
    |> List.flatten
  end


  defp fetch_and_parse(path, xpath) do
    Process.sleep(1000)
    HTTPoison.get!(@root <> path)
    |> get_response_body
    |> Meeseeks.parse
    |> Meeseeks.all(xpath(xpath))
    |> Enum.map(fn x -> Meeseeks.text(x) end)
  end

  defp get_response_body(response) do
    response.body
  end
end
