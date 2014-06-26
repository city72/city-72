class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :abbreviation, :moniker, :possessive, :color_cd, :brought_by, 
    :agency_url, :contact_email, :statement, :image_url, :resident_image_url

    has_many :affiliates
end
