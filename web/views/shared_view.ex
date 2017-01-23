defmodule Onwipca.SharedView do
  use Onwipca.Web, :view

  def logged_in?(conn) do
    !is_nil(conn.assigns[:current_user])
  end

  def management_page?(conn) do
    current_path = Path.join(["/" | conn.path_info])
    current_path != "/"
  end
end
