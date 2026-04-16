defmodule ConcurrentTaskPool.Worker do
  use GenServer, restart: :temporary

  def start_link(id) do
    GenServer.start_link(__MODULE__, id)
  end

  def init(id) do
    IO.puts("[Worker #{id}] Starting process...")
    Process.send_after(self(), :perform_work, 1000)
    {:ok, id}
  end

  def handle_info(:perform_work, id) do
    IO.puts("[Worker #{id}] Doing heavy lifting...")
    # Simulate work
    :timer.sleep(2000)
    IO.puts("[Worker #{id}] Work complete. Shutting down.")
    {:stop, :normal, id}
  end
end
