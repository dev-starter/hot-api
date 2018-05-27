defmodule HotApi.Domain.Languages.AlgorithmsTest do
  use ExUnit.Case
  doctest HotApi.Domain.Languages.Algorithms

  test "greets the world" do
    assert HotApi.soma(1,2) == 3
  end
end
