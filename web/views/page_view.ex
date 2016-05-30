defmodule Aquarelle.PageView do
  use Aquarelle.Web, :view
	def src(image) do
		src image, "960w"
	end

	def src(image, size) do
		"https://d2f33fmhbh7cs9.cloudfront.net/image/" <> to_string(image.key)
		<> "/" <> size <> "/" <> to_string(image.id) <> to_string(image.extension)
	end
end
