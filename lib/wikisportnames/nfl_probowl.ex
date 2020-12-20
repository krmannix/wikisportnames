defmodule NflProbowl do
  import Meeseeks.XPath

  @root "https://en.wikipedia.org"

  def run do
    make_requests()
  end

  defp make_requests do
    Enum.map([
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
