defmodule Aquarelle.ImageView do
  use Aquarelle.Web, :view

	def formatted_description(image) do
		{:safe, earmark image.description}
	end

	defp earmark(nil) do
		Earmark.to_html ""
	end
	defp earmark(s) do
		Earmark.to_html s
	end
	
	def src(image) do
		src image, "960w"
	end

	def src(image, size) do
		"https://d2f33fmhbh7cs9.cloudfront.net/image/" <> to_string(image.key)
		<> "/" <> size <> "/" <> to_string(image.id) <> to_string(image.extension)
	end
	
end
