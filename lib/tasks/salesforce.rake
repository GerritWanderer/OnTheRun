namespace :salesforce do
  namespace :dealers do
    desc "This task does nothing"
    task sync: [ :environment ] do
      result = Salesforce::SyncDealers.invoke
      puts result.success? ? 'Success!' : result.reason
    end

    desc "This task does nothing"
    task delete: [ :environment ] do
      result = Salesforce::DeleteDealers.invoke
      puts result.success? ? 'Success!' : result.reason
    end
  end
end
