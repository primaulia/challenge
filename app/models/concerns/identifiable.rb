module Identifiable
  extend ActiveSupport::Concern

  included do
    before_validation :standardize_identifier
    validates :label, :identifier, presence: true
  end

  def standardize_identifier
    # To make easy DB dump
    self.identifier = label.downcase.split(' ').join('_')
  end
end
