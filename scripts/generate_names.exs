{:ok, file} = File.open("names-#{:os.system_time(:millisecond)}.txt", [:write])

results = FetchNames.run
|> Enum.uniq
|> Enum.shuffle
|> Enum.map(&CleanName.clean/1)
|> Enum.reject(&is_nil/1)

IO.binwrite(file, Enum.join(results, "\n"))
File.close(file)
