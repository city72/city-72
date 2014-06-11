class Affiliates

  constructor: () ->
    @template = $('script#x-affiliate-form-template').html()
    @_countAffiliates()
    @_bindButtons()

  _bindButtons: () =>
    $('.add-affiliate').click((ev) =>
      ev.preventDefault();
      @_addNewForm();
    )

  _countAffiliates: () =>
    @affiliatesAmount = $('.affiliate').length

  _addNewForm: () =>
    template = $('script#x-affiliate-form-template').html()
    lastAffiliate = $('.affiliate').last()
    lastAffiliate.after(template)
    @_recalculateFormIds()

  _removeForm: ($affEl) =>
      $affEl.remove()
      @_recalculateFormIds()

  _recalculateFormIds: () =>
    $('.affiliate').each((i, el) ->
      $affEl = $(el)
      $nameInput = $affEl.find('.affiliate-name')
      $nameInput.attr('id', 'city_affiliates_attributes_' + i + '_name')
      $nameInput.attr('name', 'city[affiliates_attributes][' + i + '][name]')
      $urlInput = $affEl.find('.affiliate-url')
      $urlInput.attr('id', 'city_affiliates_attributes_' + i + '_url')
      $urlInput.attr('name', 'city[affiliates_attributes][' + i + '][url]')
    )

$(() ->
  affiliate = new Affiliates()
);
