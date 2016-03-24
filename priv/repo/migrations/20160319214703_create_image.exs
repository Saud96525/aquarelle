defmodule Aquarelle.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :title, :string
      add :slug, :string
      add :description, :string
      add :created, :datetime
      add :medium, :string
      add :key, :string
      add :extension, :string

      timestamps
    end

  end
end
