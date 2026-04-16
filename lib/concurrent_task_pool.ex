defmodule ConcurrentTaskPool do
  @moduledoc """
  Documentation for `ConcurrentTaskPool`.
  """

  @doc """
  Spawns concurrent workers.

  ## Examples

      iex> ConcurrentTaskPool.spawn_tasks(1)
      :ok

  """
  def spawn_tasks(count \\ 5) do
    Enum.each(1..count, fn id ->
      DynamicSupervisor.start_child(
        ConcurrentTaskPool.TaskSupervisor,
        {ConcurrentTaskPool.Worker, id}
      )
    end)
  end
end
