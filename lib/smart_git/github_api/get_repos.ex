defmodule SmartGit.GithubApi.GetRepos do
  use Tesla

  @middleware [
    {Tesla.Middleware.BaseUrl, "https://api.github.com"},
    {Tesla.Middleware.Headers, [{"user-agent", "SmartGit"}]},
    Tesla.Middleware.JSON
  ]

  def get_repos(language, page, per_page) do
    @middleware
    |> Tesla.client()
    |> get("/search/repositories",
      query: [
        q: "language:#{language}",
        sort: "stars",
        order: "desc",
        page: page,
        per_page: per_page
      ]
    )
    |> return_value()
  end

  defp return_value({:ok, %{status: 403}}), do: {:error, "Limite excedido, espere mais um pouco"}

  defp return_value({:ok, %{body: %{"items" => items}}}) do
    Enum.map(items, fn item ->
      %{
        "id" => id,
        "owner" => %{"avatar_url" => avatar_url},
        "full_name" => full_name,
        "watchers_count" => watchers_count,
        "forks" => forks,
        "description" => description,
        "name" => name,
        "open_issues" => open_issues,
        "language" => language
      } = item

      %{
        id: id,
        avatar_url: avatar_url,
        full_name: full_name,
        watchers_count: watchers_count,
        forks: 500,
        description: description,
        name: name,
        open_issues: open_issues,
        language: language
      }
    end)
  end
end
