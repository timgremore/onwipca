defmodule Onwipca.ChurchController do
  use Onwipca.Web, :controller

  alias Onwipca.Church

  def index(conn, _params) do
    churches = Repo.all(Church) |> Church.order_by(asc: :name) |> Repo.preload(:founder)
    render(conn, "index.html", churches: churches)
  end

  def new(conn, _params) do
    church = Church.changeset(%Church{})
    render(conn, "new.html", church: church)
  end

  def new(conn, %{"church" => church_params}) do
    church = Church.changeset(%Church{}, church_params)
    render(conn, "new.html", church: church)
  end

  def create(conn, %{"church" => church_params}) do
    changeset = Church.changeset(%Church{founder_id: 1}, church_params)

    case Repo.insert(changeset) do
      {:ok, church} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", church_path(conn, :show, church))
        |> put_flash(:info, "Church created successfully")
        |> render("show.html", church: church)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Onwipca.ChangesetView, "error.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    query = from c in Church, where: c.id == ^id
    church = Repo.one(query) |> Repo.preload([:founder, :pathway])

    render(conn, "show.html", church: church)
  end

  def edit(conn, %{"id" => id}) do
    church = Repo.one from c in Church,
      where: c.id == ^id

    changeset = Church.changeset(church, %{})

    render(conn, "edit.html", changeset: changeset, church: church)
  end

  def update(conn, %{"id" => id, "church" => church_params}) do
    church = Repo.get!(Church, id)
    changeset = Church.changeset(church, church_params)

    case Repo.update(changeset) do
      {:ok, church} ->
        conn
        |> redirect(to: church_path(conn, :show, church))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Onwipca.ChangesetView, "error.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    church = Repo.get!(Church, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    case Repo.delete(church) do
      {:ok, _struct} ->
        conn
        |> put_flash(:info, "Church was deleted successfully")
        |> redirect(to: church_path(conn, :index))
      {:error, _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_flash(:warn, "Operation failed")
        |> redirect(to: church_path(conn, :index))
    end
  end
end
