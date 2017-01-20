defmodule Onwipca.PathwayController do
  use Onwipca.Web, :controller

  alias Onwipca.Pathway

  def index(conn, _params) do
    pathways = Repo.all(Pathway)
    render(conn, "index.html", pathways: pathways)
  end

  def new(conn, _params) do
    changeset = Pathway.changeset(%Pathway{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pathway" => pathway_params}) do
    changeset = Pathway.changeset(%Pathway{}, pathway_params)

    case Repo.insert(changeset) do
      {:ok, _pathway} ->
        conn
        |> put_flash(:info, "Pathway created successfully.")
        |> redirect(to: pathway_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pathway = Repo.get!(Pathway, id)
    render(conn, "show.html", pathway: pathway)
  end

  def edit(conn, %{"id" => id}) do
    pathway = Repo.get!(Pathway, id)
    changeset = Pathway.changeset(pathway)
    render(conn, "edit.html", pathway: pathway, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pathway" => pathway_params}) do
    pathway = Repo.get!(Pathway, id)
    changeset = Pathway.changeset(pathway, pathway_params)

    case Repo.update(changeset) do
      {:ok, pathway} ->
        conn
        |> put_flash(:info, "Pathway updated successfully.")
        |> redirect(to: pathway_path(conn, :show, pathway))
      {:error, changeset} ->
        render(conn, "edit.html", pathway: pathway, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pathway = Repo.get!(Pathway, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pathway)

    conn
    |> put_flash(:info, "Pathway deleted successfully.")
    |> redirect(to: pathway_path(conn, :index))
  end
end
