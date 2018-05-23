defmodule HotApiTest do
  use ExUnit.Case
  doctest HotApi

  test "greets the world" do
    assert HotApi.soma(1,2) == 3
  end
end
