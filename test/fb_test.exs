defmodule FbTest do
  use ExUnit.Case
  doctest Fb

  test "greets the world" do
    assert Fb.hello() == :world
  end
end
