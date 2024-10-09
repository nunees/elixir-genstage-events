defmodule EventPushingTest do
  use ExUnit.Case
  doctest EventPushing

  test "greets the world" do
    assert EventPushing.hello() == :world
  end
end
