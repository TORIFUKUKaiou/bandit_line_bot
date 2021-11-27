defmodule BanditLineBotTest do
  use ExUnit.Case
  doctest BanditLineBot

  test "greets the world" do
    assert BanditLineBot.hello() == :world
  end
end
