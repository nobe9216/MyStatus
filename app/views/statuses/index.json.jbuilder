json.array!(@statuses) do |status|
  json.extract! status, :id, :weight, :memo
end