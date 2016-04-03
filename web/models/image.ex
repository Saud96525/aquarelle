defmodule Aquarelle.Image do
  use Aquarelle.Web, :model

	before_insert :generate_slug
	before_update :generate_slug
	
  schema "images" do
    field :title, :string
    field :slug, :string
    field :description, :string, default: ""
    field :created, Ecto.DateTime, default: Ecto.DateTime.utc
    field :medium, :string, default: ""
    field :key, :string
    field :extension, :string, default: ".jpg"

    has_many :galleryimages, Aquarelle.GalleryImage
    has_many :galleries, through: [:galleryimages, :gallery]

    timestamps
  end

  @required_fields ~w(title created key extension)
  @optional_fields ~w(description medium slug)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
	def title_to_slug({_, nil}), do: "no-title"
	def title_to_slug({_, title}) do
		to_string :slugerl.slugify(to_char_list title)
	end

	defp generate_slug(changeset) do
		case fetch_field(changeset, :slug) do
			{:changes, nil} ->
				put_change(changeset, :slug, title_to_slug(fetch_field(changeset, :title)))
			_ ->
				changeset
		end
	end


end
