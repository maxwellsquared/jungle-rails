require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation

return unless Rails.env.test?

CypressRails.hooks.before_server_start do
  # Called once, before either the transaction or the server is started
  cat1 = Category.find_or_create_by! name: 'Evergreens'

  cat1.products.create!({
    name: 'Amorphophallus Titanum',
    description: 'Amorphophallus Titanum, also known as the "Corpse Flower," is a ten-foot flower that smells like dead bodies and blooms every 40 years.',
    image: open_asset()
  })


end

CypressRails.hooks.after_transaction_start do
  # Called after the transaction is started (at launch and after each reset)
end

CypressRails.hooks.after_state_reset do
  # Triggered after `/cypress_rails_reset_state` is called
end

CypressRails.hooks.before_server_stop do
  # Called once, at_exit
end