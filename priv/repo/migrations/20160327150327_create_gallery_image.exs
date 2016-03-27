defmodule Aquarelle.Repo.Migrations.CreateGalleryImage do
  use Ecto.Migration

  def change do
    create table(:galleryimages) do
      add :gallery_id, references(:galleries)
      add :image_id, references(:images)
      add :ordinality, :integer

      timestamps
    end

  end
end
