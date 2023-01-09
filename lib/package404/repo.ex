defmodule Package404.Repo do
  use Ecto.Repo,
    otp_app: :package404,
    adapter: Ecto.Adapters.Postgres
end
