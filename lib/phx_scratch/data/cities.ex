defmodule PhxScratch.Data.Cities do
  use GenServer
  @cities_tab :cities

  ## Client API
  def get_city(id) do
    case :ets.lookup(@cities_tab, id) do
      [{_, city}] -> {:ok, city}
      _ -> :not_found
    end
  end

  ## GenServer callbacks
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(state) do
    :ets.new(@cities_tab, [:named_table, {:read_concurrency, true}, {:write_concurrency, false}, :protected])
    send(self(), :bootstrap)
    {:ok, state}
  end

  # responsible for setting up the state
  def handle_info(:bootstrap, state) do
    get_cities()
    |> Enum.each(fn {id, city} -> :ets.insert @cities_tab, {id, city} end)
    {:noreply, state}
  end

  defp get_cities do
    [
      {"HYD", %{pop: 1000_000, name: "Hyderabad"}},
      {"MUM", %{pop: 2000_000, name: "Mumbai"}},
    ]
  end
  ## end of GenServer stuff

end
