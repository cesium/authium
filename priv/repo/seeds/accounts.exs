defmodule Authium.Repo.Seeds.Accounts do
  alias Authium.Repo

  alias Authium.Accounts.User

  @users File.read!("priv/fake/users.txt") |> String.split("\n")

  def run do
    seed_accounts()
  end

  def seed_accounts do
    case Repo.all(User) do
      [] ->
        for user <- @users do
          email =
            String.downcase(user)
            |> String.normalize(:nfd)
            |> String.replace(~r/[^A-z\s]/u, "")
            |> String.replace(" ", "_")

          %{
            name: user,
            email: email <> "@mail.pt",
            password: "password1234",
          }
          |> insert_user()
        end
        _ ->
          Mix.shell().error("Found accounts, aborting seeding accounts.")
    end
  end

  defp insert_user(data) do
    %User{}
    |> User.registration_changeset(data)
    |> Repo.insert!()
  end
end

Authium.Repo.Seeds.Accounts.run()
