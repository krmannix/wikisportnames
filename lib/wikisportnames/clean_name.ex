defmodule CleanName do
  def clean(name) do
    result = String.trim(name)
    |> String.replace(~r/\A[0-9]+\z/, "")
    |> String.replace("*", "")
    |> String.replace("\"", "'")
    |> String.replace("#", "")
    |> String.replace(~r/\[[A-Za-z0-9]+\]\z/, "")
    |> String.replace(~r/\s[a-z]{1}\z/, "")
    |> String.trim

    if result == "", do: nil, else: result
  end
end
