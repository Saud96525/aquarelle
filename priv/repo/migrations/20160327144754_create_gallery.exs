defmodule Aquarelle.Repo.Migrations.CreateGallery do
  use Ecto.Migration

  def change do
    create table(:galleries) do
      add :title, :string
      add :slug, :string
      add :description, :string
      add :ordinality, :integer

      timestamps
    end

  end
end
