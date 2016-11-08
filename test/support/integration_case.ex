defmodule OnWiPca.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      use Hound.Helpers

      import Ecto, only: [build_assoc: 2]
      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import OnWiPca.Router.Helpers
      import OnWiPca.Factory
      import OnWiPca.IntegrationCase

      alias OnWiPca.Repo

      # The default endpoint for testing
      @endpoint OnWiPca.Endpoint

      hound_session
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(OnWiPca.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(OnWiPca.Repo, {:shared, self()})
    end

    :ok
  end
end
