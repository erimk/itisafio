defmodule ItisafioWeb.CypherControllerTest do
  use ItisafioWeb.ConnCase, async: true

  describe "verify_pass" do
    test "returns true for valid password", %{conn: conn} do
      conn = post(conn, "/api/verify_pass", %{password: "AbTp9!fok"})

      assert json_response(conn, 200)["result"] == true
    end

    test "returns false for invalid password", %{conn: conn} do
      conn = post(conn, "/api/verify_pass", %{password: "AbTp9!foA"})

      assert json_response(conn, 200)["result"] == false
    end

    test "returns 400 for invalid params", %{conn: conn} do
      conn = post(conn, "/api/verify_pass", %{senha: "AbTp9!fok"})

      assert json_response(conn, 400)
    end
  end
end
