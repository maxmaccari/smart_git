defmodule SmartGitWeb.Page.RepoDetail do
  use SmartGitWeb, :live_component

  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign(:message, nil)}
  end

  def handle_event("add-repo", _, socket) do
    message = toggle_message(socket.assigns.message)
    {:noreply, assign(socket, :message, message)}
  end

  defp toggle_message(nil), do: "Repo Added"
  defp toggle_message(_), do: nil
end
