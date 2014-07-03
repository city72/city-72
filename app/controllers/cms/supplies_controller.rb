class Cms::SuppliesController < BackOfficeController

  def show
    essentials = Item.where(category: Categories::ESSENTIAL.to_s).order('items.order ASC')
    @essentials = serialize_array(essentials, ItemSerializer)
    usefuls = Item.where(category: Categories::USEFUL.to_s).order('items.order ASC')
    @usefuls = serialize_array(usefuls, ItemSerializer)
    personals = Item.where(category: Categories::PERSONAL.to_s).order('items.order ASC')
    @personals = serialize_array(personals, ItemSerializer)
    kits = Kit.order(:id).all
    @kits = serialize_array(kits, KitSerializer)
  end

  def update
    supplies = JSON.parse(params[:supplies], symbolize_names: true)
    supplies.each do |s|
      supply = Item.find(s[:id])
      # Copies the attached image to the correspondent item
      s[:image] = params[s[:image_name]] if s[:image_name]
      supply.attributes = s.except(:id, :image_url, :image_name, :new_image)
      supply.save!
    end
    kits = JSON.parse(params[:kits], symbolize_names: true)
    kits.each do |k|
      kit = Kit.find(k[:id])
      k[:image] = params[k[:image_name]] if k[:image_name]
      kit.attributes = k.except(:id, :image_url, :image_name, :new_image)
      kit.save!
    end
    render status: :ok, nothing: true
  end

  private
  def serialize_array(collection, each_serializer)
    ActiveModel::ArraySerializer.new(collection, each_serializer: each_serializer).to_json
  end

end