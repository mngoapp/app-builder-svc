defmodule Builder.Model.Container do
  use Ecto.Schema
  use Builder.Model
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:title, :type], except: [:__meta__, :__struct__]}
  #@derive {Jason.Encoder, except: [:__meta__, :__struct__]}
  @required_params ~w(title type)a
  schema "containers" do
    field :title, :string
    field :type, :string
    has_many :schemas, Builder.Model.Schema
    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
