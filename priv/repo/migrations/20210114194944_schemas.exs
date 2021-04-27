defmodule Builder.Repo.Migrations.CreateSchemas do
  use Ecto.Migration

  def change do
    create table(:schemas) do
      add :title, :string
      add :type, :string
      add :jsonschema, :map
      add :uischema, :map
      add :container_id, references(:containers)
      timestamps()
    end
  end
end
