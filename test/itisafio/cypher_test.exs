defmodule Itisafio.CypherTest do
  use ExUnit.Case

  alias Itisafio.Cypher

  describe "check_password?" do
    test "returns false for white space character" do
      assert Cypher.check_password?(%{password: "AbTp9 fok"}) == false
    end

    test "returns false for repeated characters" do
      assert Cypher.check_password?(%{password: "AbTp9!foo"}) == false
    end

    test "returns false for valid length" do
      assert Cypher.check_password?(%{password: "AbTp9!fo"}) == false
    end

    test "returns false for blank password" do
      assert Cypher.check_password?(%{password: ""}) == false
    end
  end
end
