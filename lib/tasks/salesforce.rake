namespace :salesforce do
  namespace :dealers do
    desc "This task does nothing"
    task sync: [ :environment ] do
      result = Salesforce::SyncDealers.invoke
    end

    desc "This task does nothing"
    task delete: [ :environment ] do
      Salesforce::DeleteDealers.invoke
    end
  end
end
