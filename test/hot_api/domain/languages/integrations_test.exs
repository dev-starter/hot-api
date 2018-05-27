defmodule HotApi.Domain.Languages.IntegrationsTest do
  use ExUnit.Case
  doctest HotApi.Domain.Languages.Integrations

  test "greets the world" do
    assert HotApi.soma(1,2) == 3
  end
end
