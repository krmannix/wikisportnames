defmodule NbaAllstarGame do
  import Meeseeks.XPath

  @root "https://en.wikipedia.org"

  def run do
    make_requests()
  end

  defp make_requests do
    Enum.map([
      {"/wiki/2000_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2000_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2001_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2001_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2002_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2002_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2003_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2003_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2004_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2004_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2005_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2005_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2006_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/table[3]/tbody/tr/td[1]/a"},
      {"/wiki/2006_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/table[4]/tbody/tr/td[1]/a"},
      {"/wiki/2007_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[1]/table/tbody/tr/td[1]/a"},
      {"/wiki/2007_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[2]/table/tbody/tr/td[1]/a"},
      {"/wiki/2008_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[1]/a"},
      {"/wiki/2008_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[1]/a"},
      {"/wiki/2009_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[1]/a"},
      {"/wiki/2009_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[1]/a"},
      {"/wiki/2010_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[1]/a"},
      {"/wiki/2010_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[1]/a"},
      {"/wiki/2011_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[5]/table/tbody/tr/td[1]/table/tbody/tr/td[1]/a"},
      {"/wiki/2011_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[5]/table/tbody/tr/td[2]/table/tbody/tr/td[1]/a"},
      {"/wiki/2012_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2012_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2013_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[5]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2013_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[5]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2014_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2014_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2015_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2015_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2016_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2016_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2017_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2017_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2018_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2018_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[3]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
      {"/wiki/2019_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[1]/table/tbody/tr/td[2]/a"},
      {"/wiki/2019_NBA_All-Star_Game", "/html/body/div[3]/div[3]/div[5]/div[1]/div[4]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/a"},
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
