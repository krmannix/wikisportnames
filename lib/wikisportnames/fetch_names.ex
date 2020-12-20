defmodule FetchNames do
  import Meeseeks.XPath

  @root "https://en.wikipedia.org"

  def run do
    Enum.map([
      # MLB All-Star game
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
      # MLB Hall of Fame
      {"/wiki/List_of_members_of_the_Baseball_Hall_of_Fame", "//*[@id=\"mw-content-text\"]/div[1]/table[3]/tbody/tr/td[2]/i/span/span/span/a"},
      {"/wiki/List_of_members_of_the_Baseball_Hall_of_Fame", "//*[@id=\"mw-content-text\"]/div[1]/table[3]/tbody/tr/td[2]/span/span/span/a"},
      # NBA All-Star game
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
      # NBA Hall of Fame
      {"/wiki/List_of_players_in_the_Naismith_Memorial_Basketball_Hall_of_Fame", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/span/span/span/a"},
      # NFL Hall of Fame
      {"/wiki/List_of_Pro_Football_Hall_of_Fame_inductees", "/html/body/div[3]/div[3]/div[5]/div[1]/table[2]/tbody/tr/td[1]/span/span"},
      # NFL Probowl
      {"/wiki/2000_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a"},
      {"/wiki/2000_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[3]/b/a"},
      {"/wiki/2001_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/a[1]"},
      {"/wiki/2002_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a"},
      {"/wiki/2003_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a"},
      {"/wiki/2004_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a"},
      {"/wiki/2005_Pro_Bowl", "//*[@id=\"mw-content-text\"]/div[1]/table/tbody/tr/td[2]/a[1]"},
      {"/wiki/2006_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a"},
      {"/wiki/2007_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/a[1]"},
      {"/wiki/2008_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/a[1]"},
      {"/wiki/2009_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/a[1]"},
      {"/wiki/2010_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a[1]"},
      {"/wiki/2011_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a[1]"},
      {"/wiki/2012_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a[1]"},
      {"/wiki/2013_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a[1]"},
      {"/wiki/2014_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td/ul/li/a[1]"},
      {"/wiki/2015_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td/ul/li/a[1]"},
      {"/wiki/2016_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td/ul/li/a[1]"},
      {"/wiki/2017_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a"},
      {"/wiki/2018_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/b/a"},
      {"/wiki/2019_Pro_Bowl", "/html/body/div[3]/div[3]/div[5]/div[1]/table/tbody/tr/td[2]/a[1]"},
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
