defmodule Builder.Repo.Migrations.CreateContainers do
  use Ecto.Migration

  def change do
    create table(:containers) do
      add :title, :string
      add :type, :string
      timestamps()
    end
  end
end
