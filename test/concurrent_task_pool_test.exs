defmodule ConcurrentTaskPoolTest do
  use ExUnit.Case
  doctest ConcurrentTaskPool

  test "spawns tasks without crashing" do
    assert :ok = ConcurrentTaskPool.spawn_tasks(3)
  end
end
