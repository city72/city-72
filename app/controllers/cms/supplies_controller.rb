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
    jsupply = JSON.parse(params[:item], symbolize_names: true)
    jsupply = jsupply.except(:image_url, :image_name, :new_image)
    @supply = Item.find(params[:id])
    if params[:image]
      jsupply[:image] = params[:image]
    end
    @supply.update_attributes(jsupply)
    if @supply.save
      render status: :ok, nothing: true
    else
      render status: 422, json: @supply.errors
    end
  end

  def update_kit
    jkit = JSON.parse(params[:kit], symbolize_names: true)
    jkit = jkit.except(:image_url, :image_name, :new_image)
    @kit = Kit.find(params[:id])
    if params[:image]
      jkit[:image] = params[:image]
    end
    @kit.update_attributes(jkit)
    if @kit.save
      render status: :ok, nothing: true
    else
      render status: 422, json: @kit.errors
    end
  end

  private
  def serialize_array(collection, each_serializer)
    ActiveModel::ArraySerializer.new(collection, each_serializer: each_serializer).to_json
  end

end