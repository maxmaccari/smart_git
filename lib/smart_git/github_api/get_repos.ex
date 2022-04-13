defmodule SmartGit.GithubApi.GetRepos do
  def get_repos() do
    1..10 |> Enum.map(fn _ -> mock_repo() end)
  end

  defp mock_repo do
    %{
      git_id: :rand.uniform(10_000),
      avatar_url: "https://avatars.githubusercontent.com/u/1481354?s=200&v=4",
      full_name: "Elixir Language",
      watchers_count: 500,
      forks: 500,
      description: "Lorem ipsum",
      name: "Elixir",
      open_issues: 10,
      language: "Elixir"
    }
  end
end
