# Script for populating the database with fake data. You can run it as:
#      mix run priv/repo/seeds.exs
defmodule Authium.Repo.Seeds do
  @seeds_dir "priv/repo/seeds"

  def run do
    @seeds_dir
    |> File.ls!()
    |> Enum.sort()
    |> Enum.each(fn file ->
      Code.require_file("#{@seeds_dir}/#{file}")
    end)
  end
end

Authium.Repo.Seeds.run()
