ActiveAdmin.register_page "CMS" do
  ActiveAdmin.register_page "Manage Stories" do
    menu parent: "CMS", url: '/admin/stories'
  end

  ActiveAdmin.register_page "Manage Items" do
    menu parent: "CMS", url: '/admin/items'
  end

  ActiveAdmin.register_page "Manage Items to Share" do
    menu parent: "CMS", url: '/admin/kits'
  end
end