json.array!(@insurances) do |insurance|
  json.extract! insurance, :id, :carrier, :plan, :region, :age, :monthly_premium
  json.url insurance_url(insurance, format: :json)
end
