class AdvertisersList
  def advertisers
    ActiveRecord::Base.connection.execute(query).map do |record|
      advertiser = Advertiser.new(record)

      yield advertiser if block_given?

      advertiser
    end
  end

  private

  def query
    if @query.nil?
      @query = "(#{users_query} union #{companies_query}) order by ads_count desc"
    end

    @query
  end

  def users_query
    User.select("'User' as category, name, cpf as document, ads_count").to_sql
  end

  def companies_query
    Company.select("'Company' as category, name, cnpj as document, ads_count").to_sql
  end
end
