defmodule Onwipca.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers

      import Ecto, only: [build_assoc: 2]
      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import Onwipca.Router.Helpers
      import Onwipca.Factory
      import Onwipca.IntegrationCase

      alias Onwipca.Repo

      # The default endpoint for testing
      @endpoint Onwipca.Endpoint

      hound_session
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Onwipca.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Onwipca.Repo, {:shared, self()})
    end

    :ok
  end
end
