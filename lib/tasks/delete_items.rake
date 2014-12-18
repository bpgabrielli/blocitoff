
desc "Destroy items older than 7 days"
task delete_items: :environment do
  Item.dead.destroy_all
end