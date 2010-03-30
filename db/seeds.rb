# Creation des "Plans" (type  d'abonnement)
if Plan.count > 0
  Plan.delete_all
end
tab = %w{ Standard Silver Gold }
prices = [ 3990, 4990, 5990 ]
tab.each_with_index do |e, index|
  Plan.create(:nom => e, :price_in_cent => prices[index] )
end