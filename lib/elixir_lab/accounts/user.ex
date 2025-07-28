defmodule ElixirLab.Accounts.User do
  @keys [:name, :phone, :email]

  @enforce_keys @keys
  defstruct @keys

  def build(%{"name" => name, "phone" => phone, "email" => email}) do
    %__MODULE__{
      name: name,
      phone: phone,
      email: email
    }
  end
end
