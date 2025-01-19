defmodule ItisafioWeb.CypherController do
  use ItisafioWeb, :controller

  def verify_pass(conn, %{"password" => _} = params) do
    json(conn, %{result: Itisafio.Cypher.check_password?(params)})
  end

  def verify_pass(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> json("Invalid params")
  end
end
