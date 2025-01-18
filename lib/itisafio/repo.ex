defmodule Itisafio.Repo do
  use Ecto.Repo,
    otp_app: :itisafio,
    adapter: Ecto.Adapters.Postgres
end
