function get_region_quotas
  gcloud compute regions describe $argv --format json
end

function show_quota_for
  set -l region $argv[1]
  set -l metric $argv[2]
  if ! set -q region_quotas
    set -g region_quotas (get_region_quotas $region)
  end
  echo $region_quotas | jq '.quotas[] | select(.metric == "'$metric'").limit'
end
