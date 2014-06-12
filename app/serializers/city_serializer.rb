class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :abbreviation, :moniker, :possessive, :color_cd, :image_credit, 
    :resident_image_credit, :brought_by, :agency_url, :contact_email

    has_many :affiliates
end
