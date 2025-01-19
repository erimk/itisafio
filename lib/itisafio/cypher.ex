defmodule Itisafio.Cypher do
  import Ecto.Changeset

  def check_password?(params) do
    {%{password: ""}, %{password: :string}}
    |> cast(params, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 9)
    |> validate_format(:password, ~r/[A-Z]/)
    |> validate_format(:password, ~r/[a-z]/)
    |> validate_format(:password, ~r/[0-9]/)
    |> validate_format(:password, ~r/[!@#$%^&*()-+]/)
    |> validate_exclusion(:password, [" "])
    |> validate_unique_char()
    |> case do
      %{valid?: true} -> true
      _ -> false
    end
  end

  def validate_unique_char(%{changes: %{password: string}} = changeset) do
    if has_repeated_letters?(string),
      do: add_error(changeset, :password, "Password must not have repeated characters"),
      else: changeset
  end

  def validate_unique_char(changeset), do: changeset

  defp has_repeated_letters?(string) do
    string
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.any?(fn {_char, count} -> count > 1 end)
  end
end
