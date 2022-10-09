defmodule Authium.Repo do
  use Ecto.Repo,
    otp_app: :authium,
    adapter: Ecto.Adapters.Postgres
end
