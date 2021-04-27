defmodule Builder.Model.Schema do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, except: [:__meta__, :__struct__]}
  @required_params ~w(title type jsonschema)a
  @optional_params ~w(uischema)a
  schema "schemas" do
    field :title, :string
    field :type, :string
    field :jsonschema, :map
    field :uischema, :map
    belongs_to :container, Builder.Model.Container
    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
