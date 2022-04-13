defmodule SmartGitWeb.PageLiveTest do
  use SmartGitWeb.ConnCase

  import Phoenix.LiveViewTest

  test "load page elements", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.page_path(conn, :index))

    assert has_element?(view, "[data-role=btn-language-select][data-id=elixir]", "Elixir")
    assert has_element?(view, "[data-role=btn-language-select][data-id=elixir]", "Ruby")
    assert has_element?(view, "[data-role=btn-language-select][data-id=elixir]", "Javascript")
    assert has_element?(view, "[data-role=btn-language-select][data-id=elixir]", "Rust")
    assert has_element?(view, "[data-role=btn-language-select][data-id=elixir]", "F#")
    assert has_element?(view, "[data-role=btn-language-select][data-id=elixir]", "Elm")
  end
end
