ActiveAdmin.register AdminUser do
  menu false
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end

  ActiveAdmin.register_page "Storiess" do
    menu parent: "CMS", url: '/admin/stories'
  end

  ActiveAdmin.register_page "Itemss" do
    menu parent: "CMS", url: '/admin/items'
  end

  ActiveAdmin.register_page "Kitss" do
    menu parent: "CMS", url: '/admin/kits'
  end

  ActiveAdmin.register_page "Admin Userss" do
    menu parent: "CMS", url: '/admin/admin_users'
  end
end                                   
