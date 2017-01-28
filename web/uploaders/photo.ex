defmodule Onwipca.Photo do
  use Arc.Definition
  use Arc.Ecto.Definition

  @acl :public_read

  if Mix.env != :prod do
    def __storage, do: Arc.Storage.Local
  end

  # Include ecto support (requires package arc_ecto installed):
  # use Arc.Ecto.Definition

  # To add a thumbnail version:
  @versions [:original, :medium, :small]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a medium transformation:
  def transform(:medium, _) do
    {:convert, "-resize 400x -format png -limit disk 100MB", :png}
  end

  # Define a small transformation:
  def transform(:small, _) do
    {:convert, "-strip -thumbnail 150x -format png -limit disk 100MB", :png}
  end

  # Override the persisted filenames:
  def filename(version, {file, scope}) do
    "#{file.file_name}-#{version}"
  end

  # Override the storage directory:
  # def storage_dir(version, {file, scope}) do
  #   "uploads/user/avatars/#{scope.id}"
  # end

  # Provide a default URL if there hasn't been a file uploaded
  # def default_url(version, scope) do
  #   "/images/avatars/default_#{version}.png"
  # end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: Plug.MIME.path(file.file_name)]
  # end
end
