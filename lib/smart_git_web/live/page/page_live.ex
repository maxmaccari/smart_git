defmodule SmartGitWeb.PageLive do
  use SmartGitWeb, :live_view

  alias SmartGitWeb.Page.RepoDetail

  def mount(_params, _session, socket) do
    repos = SmartGit.GithubApi.get_repos()
    {:ok, socket |> assign(:repos, repos)}
  end
end
