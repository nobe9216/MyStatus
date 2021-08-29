json.array!(@statuses) do |status|
  json.title "#{status.weight}kg,\n
    朝食：#{status.breakfast} \n
    昼食：#{status.lunch} \n
    夕食：#{status.dinner} \n
    間食：#{status.snacks}"
  json.date status.date
  json.url user_status_path(@user.id, status.id)
end
