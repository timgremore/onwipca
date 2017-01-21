defmodule Onwipca.PathwayView do
  use Onwipca.Web, :view

  def church_count(pathway) do
    Onwipca.Pathway.church_count(pathway)
  end
end
