namespace :heroku do
  task reset_database: :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      if table != 'schema_migrations' && table != 'ar_internal_metadata'
        table.singularize.camelize.constantize.destroy_all
        ActiveRecord::Base.connection.reset_pk_sequence!(table)
      end
      ::Db::Seed.execute
    end
  end
end
