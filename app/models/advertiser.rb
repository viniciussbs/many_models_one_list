class Advertiser
  attr_reader :category, :name, :document

  DOCUMENT_TYPES = { 'User' => 'CPF', 'Company' => 'CNPJ' }.freeze

  def initialize(attributes = {})
    attributes.each do |name, value|
      instance_variable_set "@#{name}", value
    end
  end

  def ads_count
    @ads_count.to_i if @ads_count.present?
  end

  def document_type
    DOCUMENT_TYPES[self.category]
  end

  def user?
    self.category == 'User'
  end

  def company?
    self.category == 'Company'
  end
end
