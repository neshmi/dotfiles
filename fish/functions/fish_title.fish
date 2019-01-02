function fish_title
  set repo (git rev-parse --show-toplevel 2>/dev/null)

  if [ "$repo" = "" ]
    pwd
  else
    if [ "$repo" != "$fish_title_last_repo_path" ]
      set --global fish_title_last_repo_path "$repo"
      if git remote get-url origin > /dev/null 2>&1
        set --local origin (git remote get-url origin)
        set --local name (string match -r "(?:git@github\.com:|https://github.com/)([^.]*)(?:\.git)?" $origin)
        set --global fish_title_last_repo_name $name[2]
      else
        set --global fish_title_last_repo_name (pwd)
      end
    end
    echo "$fish_title_last_repo_name"
  end
end