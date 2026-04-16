defmodule ConcurrentTaskPoolTest do
  use ExUnit.Case
  doctest ConcurrentTaskPool

  test "greets the world" do
    assert ConcurrentTaskPool.hello() == :world
  end
end
