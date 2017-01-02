defmodule Onwipca.LayoutView do
  use Onwipca.Web, :view

  def logged_in?(conn) do
    !is_nil(conn.assigns[:current_user])
  end
end
