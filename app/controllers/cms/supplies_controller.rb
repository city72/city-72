class Cms::SuppliesController < BackOfficeController

  def show
    essentials = Item.where(category: Categories::ESSENTIAL.to_s).order('items.order ASC')
    @essentials = serialize_array(essentials, ItemSerializer)
    usefuls = Item.where(category: Categories::USEFUL.to_s).order('items.order ASC')
    @usefuls = serialize_array(usefuls, ItemSerializer)
    personals = Item.where(category: Categories::PERSONAL.to_s).order('items.order ASC')
    @personals = serialize_array(personals, ItemSerializer)
    kits = Kit.all
    @kits = serialize_array(kits, KitSerializer)
  end

  def update
  end

  private 
  def serialize_array(collection, each_serializer)
    ActiveModel::ArraySerializer.new(collection, each_serializer: each_serializer).to_json
  end

end